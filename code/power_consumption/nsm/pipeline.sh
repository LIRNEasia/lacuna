#!/bin/bash

# Execute the R script - same implementation in python below
#Rscript /lirneasia/projects/lacuna/data/convert_LA_data_wide2long.R

#execute python script
/home/manifold/.pyenv/versions/3.8.10/bin/python /lirneasia/projects/lacuna/data/z_codes_power_consumption/nsm/convert_LA_ssn_sample_wide2long.py

# environment variable for session
export PGPASSWORD='balcombe08'

# Modify and execute the SQL script
psql -U postgres -h localhost -d postgres -a -f "/lirneasia/projects/lacuna/data/z_codes_power_consumption/nsm/power_consumption_nsm_data.sql"



# Load data from CSV to the database
psql -U postgres -h localhost -d postgres -c "\\copy power_consumption_nsm (\"UNIQUE_CODE\", \"ACCOUNT_NO\", \"METER_TYPE\", \"BRANCH\", \"CSC\", \"TARIFF\", \"YEAR\", \"MONTH\", \"CONSUMPTION\") from '/lirneasia/projects/lacuna/data/processed/LA_social_safety_nets_sample_LONG.csv' WITH DELIMITER ',' csv header;"


