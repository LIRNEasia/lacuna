#! /home/manifold/.pyenv/versions/3.8.10/bin/python

import pandas as pd

data = pd.read_csv("/lirneasia/projects/lacuna/data/raw/LA_social_safety_nets_sample.csv")

#  manipulate data
data_long = (
    data
    .drop(columns=['in_sample'])
    .melt(id_vars=['Unique_code', 'ACCOUNT_NO', 'METER_TYPE', 'BRANCH', 'CSC', 'TARIFF'], var_name='year-month', value_name='consumption')
    .assign(year=lambda x: x['year-month'].str.extract(r'(\d{4})'))
    .assign(month=lambda x: x['year-month'].str.extract(r'\d{4}(.{2})'))
    .dropna(subset=['consumption'])
    .drop(columns=['year-month'])
    
)

data_long['consumption'] = data_long['consumption'].str.extract(r'(\d+)').fillna(0).astype('int64')

columns = [col for col in data_long.columns if col != 'consumption']

data_long = data_long.reindex(columns=columns + ['consumption'])


# Write to CSV
data_long.to_csv('/lirneasia/projects/lacuna/data/processed/LA_social_safety_nets_sample_LONG.csv', index=False)
