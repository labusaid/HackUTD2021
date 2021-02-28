import urllib3
import json
import time                               # time.sleep
import re
from datetime import datetime
import numpy as np                        # np.mean, np.array
import pandas as pd                       # pd.DataFrame


import nvidia_item_scrape


def get_item(post_content, items):
    # TODO: Add other types of electronics (hard-code here?)
    hard_code_items = ['gtx 1660 super', 'rtx 2080 super', 'gtx 1050 ti', 'rtx 3060 ti', 'rx 6800 xt',
                       'rtx 3080', 'rtx 2070', 'rtx 3070', 'gtx 1070',
                       'rtx 3090', 'rx 6800', 'rtx 3060', 'gtx 1650', 'rx 570']

    # Check against our own list
    for item in hard_code_items:
        if ' ' + item + ' ' in post_content.lower():
            return item.strip()

    # Check against the scraped list
    for item in items:
        if ' ' + item + ' ' in post_content.lower():
            return item.strip()
    return None


def get_price(post_content):
    # Price string indices in post_content
    i = []

    # Get the indices of all dollar signs in post content
    if '$' in post_content:
        p = post_content
        while True:
            ind = p.index('$')
            i.append(ind)
            p = p[ind + 1:]
            if '$' not in p:
                break

    # No prices mentioned in post
    if len(i) == 0:
        return None

    # One price mentioned in post
    elif len(i) == 1:
        tmp_string = post_content[i[0] + 1:]

        if not tmp_string:  # someone put the dollar sign AFTER the number !?
            tmp_string = post_content[:i[0]]
            temp_price_string = tmp_string.split()[-1]
        else:
            temp_price_string = tmp_string.split()[0]

        price_string = ''.join([i for i in temp_price_string if i.isdigit()])
        if price_string:
            return int(price_string)
        else:
            return None

    # More than one price mentioned in post; list average if the max and min are within 10% otherwise toss the data
    elif len(i) > 1:
        prices = []
        for ind in i:
            price_x = post_content[ind + 1:].split()[0]
            price_string = ''.join([i for i in price_x if i.isdigit()])
            if price_string:
                prices.append(int(price_string))
            else:
                continue
        if prices:
            if (max(prices) - min(prices)) / (max(prices) + 0.01) <= .1:
                return np.mean(prices)
        else:
            return None


def get_post_list_until(unix_cutoff):
    # define the params
    pushshift_base_url = 'https://api.pushshift.io/reddit/submission/search/'
    before_utc = unix_cutoff  # this will change below!!
    sort_type = 'created_utc'
    sort = 'desc'
    subreddit = 'hardwareswap'

    # setup retry mechanism
    retries = urllib3.Retry(total=8, backoff_factor=0.25)
    http = urllib3.PoolManager(retries=retries)

    # loop!
    post_list = []
    for i in range(150):
        # build the url out of params
        url = (pushshift_base_url +
               '?before=' + str(before_utc) +
               '&sort_type=' + sort_type +
               '&sort=' + sort +
               '&subreddit=' + subreddit +
               '&limit=100')

        # request get
        r = http.request('GET', url)
        if r.status != 200:
            print(str(i+1) + 'th loop', r.status)

        # get the data and add it in to our big list
        r_data = json.loads(r.data.decode('utf-8'))
        r_data = r_data['data']
        post_list += r_data

        # set back the clock for the next loop
        before_utc = r_data[-1]['created_utc']
        if (i + 1) % 10 == 0:
            print(str(i+1) + 'th loop is done.')

        # sleep for one second (due to request limit)
        time.sleep(1)
    return post_list


def get_df(post_list, item_set):
    # Loop through the recent reddit posts
    i = 0
    pat = re.compile(r'^(\[[\w-]+])\s*(\[\w])')
    data_list = []
    for post in post_list:
        # Only consider posts that have desired title format (check the reddit rules)
        result = re.match(pat, post['title'])

        if result:
            # Get the post location
            location = result.group(1)[1:-1]

            # Get buy/sell boolean
            is_selling = None
            if 'link_flair_text' in post:
                if post['link_flair_text'] == 'SELLING':
                    is_selling = True
                elif post['link_flair_text'] == 'BUYING':
                    is_selling = False

            # Get the date
            # TODO: rather have unix time in seconds or string time?
            u_time = post['created_utc']
            s_time = datetime.utcfromtimestamp(u_time).strftime('%Y-%m-%d %H:%M:%S')

            # Combine title and body for entire post content
            post_content = post['title'] + ' ' + (post['selftext'] if 'selftext' in post else '')

            # TODO: extract items from posts that match other companies' item_list
            # Extract any graphics card items
            graphics_item = get_item(post_content, item_set)

            # Extract mentioned price on graphics cards
            graphics_price = get_price(post_content)

            data_row = [location, is_selling, s_time, graphics_item, graphics_price, post['title'], post['url']]
            data_list.append(data_row)

            # Print after every 50 posts processed
            i += 1
            if i % 50 == 0:
                print(str(i) + 'th post processed')
    return pd.DataFrame(np.array(data_list))


# Scrape wikipedia for nvidia product set
nvidia_item_set = nvidia_item_scrape.nvidia_item_scrape()

# OPTION 1: Load post_list from existing file
f = open('post_list.json', 'r', encoding='utf-8')
dl = json.load(f)

# # OPTION 2: run the code below again to re-scrape wikipedia and reddit
# # ---------------------------------------------------------------------------------------------------------
# # Get a list of posts (type dict) from reddit
# dl = get_post_list_until(unix_cutoff=1614532850)
#
# # make a json object out of it
# with open('post_list.json', 'w', encoding='utf-8') as f:
#     json.dump(dl, f, indent=4)
# # ---------------------------------------------------------------------------------------------------------

# Create a dataframe with relevant data from the list of posts
df = get_df(dl, nvidia_item_set)

# write to the csv
df.to_csv('reddit_data.csv')
