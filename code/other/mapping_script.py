import pandas as pd
import uuid

'''
This Python script reads a list of 8,000 household consumers provided by LECO. 
It generates a new CSV file that includes a newly created identifier to replace the LECO account numbers,
for the purpose of annonymizing the dataset.

input: /lirneasia/data/lacuna/raw/z_other/survey_pool_leco.csv
output: /lirneasia/data/lacuna/raw/z_other/survey_pool_mapped.csv

'''

file = '/lirneasia/data/lacuna/raw/z_other/survey_pool_leco.csv'


df = pd.read_csv(file)

def generate_unique_id(n):
    return f"ID{str(n).zfill(4)}"

df['ID'] = [generate_unique_id(i+1) for i in range(len(df))]

# Dropping or mask the account_number column
#df.drop('account_number', axis=1, inplace=True)

print(df)

df.to_csv('/lirneasia/data/lacuna/raw/z_other/survey_pool_mapped.csv', index= False)

