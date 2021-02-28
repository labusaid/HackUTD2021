import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import pandas as pd
import os

#
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "HackUTD2021-61cb32512b9e.json"
cred = credentials.ApplicationDefault()
firebase_admin.initialize_app(cred, {
  'projectId': 'hackutd2021',
})
db = firestore.client()

# firebase document reference
reddit_ref = db.collection(u'reddit')

# get the data grouped by item name
df = pd.read_csv('reddit_data.csv')
df = df.drop(columns=['Unnamed: 0'])
df.columns = ['location', 'selling', 'postDate', 'name', 'price', 'title', 'url']
shrinked_df = df.dropna()
grouped = shrinked_df.groupby('name')


for name, group in grouped:
    data_dict = {'name': name,
                 'posts': []}
    for i, row in group.iterrows():
        data_dict['posts'].append(row.drop(labels=['name']).to_dict())
    reddit_ref.document(name).set(data_dict)

