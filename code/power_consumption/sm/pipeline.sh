#!/bin/bash

# environment variable for session
export PGPASSWORD='balcombe08'

#execute python script
/home/manifold/.pyenv/versions/3.8.10/bin/python /lirneasia/projects/lacuna/code/power_consumption/sm/field_cleaner.py

# Modify and execute the SQL script to create raw sm table
#psql -U postgres -h localhost -d lacuna -a -f "/lirneasia/projects/lacuna/code/power_consumption/sm/sm_raw.sql"


DATA_DIR="/lirneasia/data/lacuna/processed/sm_april_2024_dump"

# Load data from CSV to the database to raw sm
#psql -U postgres -h localhost -d lacuna -c "\\copy raw.power_consumption_sm (\"serial\", \"customerref\", \"timestamp\", \"obis\", \"date\", \"time\", \"importkwh(kwh)\", \"exportkwh(kwh)\", \"importkvarh(kvarh)\", \"exportkvarh(kvarh)\", \"phaseainstcurrent(a)\", \"phasebinstcurrent(a)\", \"phasecinstcurrent(a)\", \"phaseainstvoltage(v)\", \"phasebinstvoltage(v)\", \"phasecinstvoltage(v)\", \"powerfactor\", \"avgimportkw(kw)\", \"avgexportkw(kw)\", \"avgimportkva(kva)\", \"avgexportkva(kva)\", \"avgcurrent(v)\", \"avgvoltage(v)\") from '/lirneasia/data/lacuna/processed/sm_april_2024_dump/3LOAD_PROFILE_HISTORICAL_READINGS_INVENTORY_17_04_2024.csv' WITH DELIMITER ',' csv header;"

for file in "$DATA_DIR"/*.csv; do
    # Execute the psql command for each file
    psql -U postgres -h localhost -d lacuna -c "\\copy raw.power_consumption_sm (\"serial\", \"customerref\", \"timestamp\", \"obis\", \"date\", \"time\", \"importkwh(kwh)\", \"exportkwh(kwh)\", \"importkvarh(kvarh)\", \"exportkvarh(kvarh)\", \"phaseainstcurrent(a)\", \"phasebinstcurrent(a)\", \"phasecinstcurrent(a)\", \"phaseainstvoltage(v)\", \"phasebinstvoltage(v)\", \"phasecinstvoltage(v)\", \"powerfactor\", \"avgimportkw(kw)\", \"avgexportkw(kw)\", \"avgimportkva(kva)\", \"avgexportkva(kva)\", \"avgcurrent(v)\", \"avgvoltage(v)\") FROM '$file' WITH DELIMITER ',' CSV HEADER;"
done


# Execute creating clean schema power consumption sm table
#psql -U postgres -h localhost -d lacuna -a -f "/lirneasia/projects/lacuna/code/power_consumption/sm/sm_cleaned.sql"

#Excute transfering data from raw to cleaned 
#psql -U postgres -h localhost -d lacuna -a -f "/lirneasia/projects/lacuna/code/power_consumption/sm/sm_raw_to_clean.sql"


#Executing relevant sql statements
psql -U postgres -h localhost -d lacuna -a -f "/lirneasia/projects/lacuna/code/power_consumption/sm/relavent_sql_statements.sql"

# to run the pipeline.sh file -> ./pipeline.sh