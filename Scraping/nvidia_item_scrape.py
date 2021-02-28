from bs4 import BeautifulSoup
import requests
import re


def nvidia_item_scrape():
    # Get http response
    r = requests.get('https://en.wikipedia.org/wiki/List_of_Nvidia_graphics_processing_units')

    # Get the text and soup it
    wiki_doc = r.text
    soup = BeautifulSoup(wiki_doc, 'html.parser')

    # Get the main content div
    main_div = soup.find('div', id='mw-content-text')
    main_div = main_div.find('div', class_='mw-parser-output')

    # Get all the tables in it
    tables = main_div.find_all('table', recursive=False)

    # Instantiate item list
    items = []

    # Loop through each table (ignore 2 navboxes at bottom of the wiki page) and get all the model names
    for table in tables:
        for row in table.find_all('tr')[2:]:
            # Get the first column value (the model)
            txt = ''
            e = row.find('th')
            txt = '';
            if e:
                # Get everything in the wikipedia table cell
                for string in e.stripped_strings:
                    txt += (string + ' ')

                # Clean out the extraneous links; keep the name
                items.append(re.sub(r'((\[.+\]\s*)+$)', '', txt))


    return items
