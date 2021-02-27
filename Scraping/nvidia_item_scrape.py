from bs4 import BeautifulSoup
import requests

# Get http response
r = requests.get('https://en.wikipedia.org/wiki/List_of_Nvidia_graphics_processing_units')

# Get the text and soup it
wiki_doc = r.text
soup = BeautifulSoup(wiki_doc, 'html.parser')

# Get the main content div
main_div = soup.find('div', class_='mw-parser-output')

# Get all the tables in it
tables = main_div.find_all('table')
print(len(tables))

# Loop through each table and get all the model names
