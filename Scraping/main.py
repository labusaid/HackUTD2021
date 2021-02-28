import praw                     # reddit api
import re                       # extracting from reddit posts
from datetime import datetime   # getting the date from reddit posts
import pandas as pd             # for exporting data to csv
import numpy as np

import nvidia_item_scrape

password = ''
username = ''


def get_item(post_content, items):
    # TODO: Add other types of electronics
    hard_code_items = ['RTX 3060 Ti', 'RX 6800 XT', 'RTX 3080', 'RTX 2070', 'RTX 3070',
                       'RTX 3090', 'RX 6800']
    for item in hard_code_items:
        if item in post_content:
            return item.strip()

    for item in items:
        if item in post_content:
            return item.strip()
    return None


def get_price(post_content):
    i = []
    if '$' in post_content:
        p = post_content
        while True:
            ind = p.index('$')
            i.append(ind)
            p = p[ind+1:]
            if '$' not in p:
                break

    # No prices mentioned in post
    if len(i) == 0:
        return None

    # One price mentioned in post
    elif len(i) == 1:
        return post_content[i[0] + 1:].split()[0]

    # More than one price mentioned in post; validate that all are the same otherwise don't list price
    elif len(i) > 1:
        price_x = post_content[i[0] + 1:].split()[0]
        for ind in i[1:]:
            price_y = post_content[ind + 1:].split()[0]
            if price_y != price_x:
                return None
        return price_x


# Get a list of nvidia item names (using the other module)
# TODO: add item_list's from other companies; top 10 hardware companies or similar;
nvidia_items = nvidia_item_scrape.nvidia_item_scrape()

# Remove incorrect items (not nvidia products)
nvidia_items = [i for i in nvidia_items if i != 'Model ' and i != 'MOperations/s ' and
                i != 'Min ( MHz ) ' and i != 'Hardware ' and i != 'Core ( MHz ) ' and i != 'Cuda cores (total) ' and
                i != 'Fillrate ' and i != 'Clock rate ' and i != 'Clock speed ']
nvidia_items = set(nvidia_items)

# Authenticate the PRAW api
reddit = praw.Reddit(client_id='8QxRzFja_iYCCw',
                     client_secret='o3B0XooCXDo12xSh43PE2sNW8nGMCw', password=password,
                     user_agent='windows:hackutd:v0.0 (by u/' + username + ')', username=username)

# Get 100 of the most recent posts from r/hardwareswap
time_limit = 1614497260
post_table = []
posts = reddit.subreddit("hardwareswap").new(limit=10000)

# # TESTING: count the posts
# i = 0
# for post in posts:
#     i += 1
# print(str(i) + 'posts total')

i = 0
# Loop through the recent reddit posts
pat = re.compile(r'^(\[[\w-]+])\s*(\[\w])')
for post in posts:
    # Only consider posts in desired time window
    if post.created_utc < time_limit:
        # Only consider posts that have desired title format (check the reddit rules)
        result = re.match(pat, post.title)

        if result:
            # Get the post location
            location = result.group(1)[1:-1]

            # Get buy/sell boolean
            is_selling = True if result.group(2)[1] == 'H' else False if result.group(2)[1] == 'W' else None

            # Get the date
            u_time = post.created_utc
            s_time = datetime.utcfromtimestamp(u_time).strftime('%Y-%m-%d %H:%M:%S')

            # Extract any graphics card items
            # TODO: extract items from posts that match other companies' item_list
            post_content = post.title + ' ' + post.selftext
            graphics_item = get_item(post_content, nvidia_items)

            # Extract any prices on graphics cards
            graphics_price = get_price(post_content)

            # Append it to our data list
            if graphics_item:
                # TESTING: print the item
                print(graphics_item)
                if graphics_price:
                    post_table.append([location, is_selling, s_time, graphics_item, graphics_price])
                else:
                    post_table.append([location, is_selling, s_time, graphics_item, None])
            else:
                post_table.append([location, is_selling, s_time, None, None])

            # Print after every 50 posts processed
            i += 1
            if i % 50 == 0:
                print(str(i) + 'th post processed')

            # break at 5000 posts
            if len(post_table) >= 5000:
                break

df = pd.DataFrame(np.array(post_table))
print(df)
df.to_csv('r_hardware_swap_data.csv.csv')
