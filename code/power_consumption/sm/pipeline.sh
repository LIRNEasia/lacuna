#!/bin/bash

# Execute the R script - same implementation in python below
#Rscript /lirneasia/projects/lacuna/data/convert_LA_data_wide2long.R

# environment variable for session
export PGPASSWORD='balcombe08'

# Modify and execute the SQL script
psql -U postgres -h localhost -d postgres -a -f "/lirneasia/projects/lacuna/data/z_codes_power_consumption/sm/power_consumption_sm_data.sql"



# Load data from CSV to the database
psql -U postgres -h localhost -d postgres -c "\\copy power_consumption_sm (\"SERIAL\", \"CUSTOMER_REF\", \"TIMESTAMP\", \"OBIS\", \"DATE\", \"TIME\", \"IMPORT_KWH (kWh)\", \"EXPORT_KWH (kWh)\", \"IMPORT_KVARH (kvarh)\", \"EXPORT_KVARH (kvarh)\", \"PHASE_A_INST._CURRENT (A)\", \"PHASE_B_INST._CURRENT (A)\", \"PHASE_C_INST._CURRENT (A)\", \"PHASE_A_INST._VOLTAGE (V)\", \"PHASE_B_INST._VOLTAGE (V)\", \"PHASE_C_INST._VOLTAGE (V)\", \"POWER_FACTOR\", \"AVG._IMPORT_KW (kW)\", \"AVG._EXPORT_KW (kW)\", \"AVG._IMPORT_KVA (kVA)\", \"AVG._EXPORT_KVA (kVA)\", \"AVG._CURRENT (V)\", \"AVG._VOLTAGE (V)\") from '/lirneasia/projects/lacuna/data/raw/Leco_data/First 500/1/LOAD_PROFILE_HISTORICAL_READINGS_INVENTORY_17_04_2024.csv' WITH DELIMITER ',' csv header;"
 
# to run the pipeline.sh file -> ./pipeline.sh