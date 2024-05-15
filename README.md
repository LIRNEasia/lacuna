# Lacuna Project Data Engineering and Data Pipelines

## Overview

This repository is dedicated to managing the Lacuna project's data engineering process and data pipelines. The project aims to build a comprehensive machine-learning dataset on "Household Electricity Consumption" in Sri Lanka. The data is stored in our manifold machine within the directory `LIRNEasia/projects/lacuna/data/raw`. Access to this data is restricted to users within the LIRNEasia unix user group, which includes all members of our DAP team.

![Summary of the pipeline](https://github.com/LIRNEasia/lacuna-data-engineering/blob/main/FlowDiagram.png?raw=true)

## Data Storage

The raw data for the Lacuna project is stored in the manifold machine at the following location:
```
LIRNEasia/projects/lacuna/data/raw
```
Access to this directory is limited to users within the `LIRNEasia` unix user group.

This is an overview of the data files located in the "raw" folder.

### 1. LA_lacuna_sample_18092023.xlsx, LA_lacuna_sample.csv

- **Description**: These files contain details obtained from LECO regarding approximately 8000 households, which were utilized to draw a sample of 4500 households for the Lacuna project survey. Both files contain identical data, differing only in file format.
- **Data Provider**: LECO

### 2. LA_LECO_Main_Member_Combined 12122023.csv

- **Description**: This file contains survey data related to social safety net projects.
- **Data Provider**: SRL, LA_core_stat_team

### 3. LA_social_safety_nets_sample.csv

- **Description**: Contains electricity consumption data about social safety nets projects.
- **Data Provider**: LECO

### 4. LOAD_PROFILE_HISTORICAL_READINGS_INVENTORY_20_12_2023 - 50 meters (1).csv, LOAD_PROFILE_HISTORICAL_READINGS_INVENTORY_20_12_2023 - 50 meters.csv

- **Description**: These files contain the electricity consumption records of 100 smart-metered households. These households are part of the initial 8000 household sample used to draw the 4500 household sample for the study.
- **Data Provider**: LECO

### 5. Variable properties.xlsx

- **Description**: This file serves as the data dictionary for the survey dataset of the social safety nets project.

## Database
We utilize a PostgreSQL server to store the data in SQL tables. This allows for efficient querying and manipulation of the dataset. For database management and interaction, we recommend using DBeaver, a database tool for developers, administrators, and analysts. DBeaver provides an intuitive interface for managing PostgreSQL databases and executing SQL queries.

## Data Pipelines

To streamline and automate the process of getting data from raw files to the PostgreSQL server, we use the `pipeline.sh` script provided in this repository. The `pipeline.sh` script has the necessary steps to extract data from raw files, transform it as needed, and load it into the PostgreSQL database.

## Getting Started

To begin using the data engineering process and data pipelines, follow these steps:

1. Ensure that you have access to the `LIRNEasia` unix user group to access the raw data directory.
2. Log into the PostgreSQL server, where the database is hosted.
3. Install a database client on your local machine to connect to the server. EX: DBeaver, but you can use others, like SQuirreL, or DBVisualizer. When connecting, remember that the user is "Postgres" and get the password from DAP members.
4. The files stored in this repository will be in the
   ```
   /lirneasia/projects/lacuna/data
   ```
    directory
6. Customize the `pipeline.sh` script to match data processing requirements.
7. Execute the `pipeline.sh` script to start the data pipeline process.


## Contributors

- @xuxoramos
- @KasunAmare
- @merlsyrex
- @chanukaravishan

