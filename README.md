# CDE_linux_git_assignment

This project is an assignment submitted to Core Data Engineer bootcamp. The aim of the project is to use linux to perform some ETL task. The assignment is divided into three parts:

- Part 1: Bash scripting to perform ETL task and automation with cron job
- Part 2: A bash script that moves one or more csv and json files to a directory called `json_and_csv`
- Part 3: A bash script that created a database `posey`, create tables and copy data from csv files into the table. Some queries are performed on the database and was stored in SQL Scripts folder.

## Part 1: ETL

In this task, a bash script was written that extract a csv file from a URL, transformed the csv file by renaming column and select certain fields, then load the transformed file to a directory called Gold. The bash script for this task can be assessed [here](./Scripts/Bash_Scripts/CDE_ETL_script.sh) There are some peculiarities with this bash script:

1. The URL is expoted into an environmental variable and was called inside the script.
2. The cron job was set up a follow: `0 0 * * * /bin/bash -c 'source ~/.cron_env && /Scripts/Bash_Scripts/CDE_ETL_script.sh`. The script is set to run at 12:00 AM (representing 0 0) in cron. The `source ~/.cron_env` run the environmental variables prior to running the script while `/Scripts/Bash_Scripts/CDE_ETL_script.sh` specify the path to the script to be run by cron.
3. The csv file for the extraction task can be assessed via this [link](https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv)

The architectural diagram of the ETL pipeline is as shown below:

## Part 2

In this task, a simple bash script is created to move csv and json files from one folder into another. The script can be assessed [here](./Scripts/Bash_Scripts/move_csv_json.sh).

## Part 3

In this task, a bash script is written that iterates over and copies each of the CSV files into a PostgreSQL database called `posey`. The CSV files for this task can be accessed via this [link](https://github.com/jdbarillas/parchposey/tree/master/data-raw). This task involves:

- Installation and setting up of postgresql `psql` in linux following the official [documentation](https://documentation.ubuntu.com/server/how-to/databases/install-postgresql/).
- Compiling bash script to create database, create tables, and iterates over and copies each of the CSV files into the tables.
- The script can be assessed [here](./Scripts/Bash_Scripts/parch_and_posey.sh).

## Analysis of the posey database using SQL

Sql queries are written to answer questions possed by the instructor. The answers (sql scripts) to the four questions can be found in the [SQL Script directory](./Scripts/SQL_Scripts/).
