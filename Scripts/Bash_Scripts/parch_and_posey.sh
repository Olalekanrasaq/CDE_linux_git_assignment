#! /bin/bash

# This script iterates over and copies CSV files into a PostgreSQL database name posey.
folder_path="./database_csv_data"  # path to csv folder

# creating the databasse
echo "Creating database..."

sudo -u postgres psql -c "CREATE DATABASE posey;"

# create tables
echo -e "\nCreating table web_events..."

sudo -u postgres psql -d posey -c "CREATE TABLE web_events (
	id integer,
	account_id integer,
	occurred_at timestamp,
	channel bpchar
);"

echo -e "\nLoading csv data into web_events..."

sudo -u postgres psql -d posey -c "\copy web_events FROM '$folder_path/web_events.csv' DELIMITER ',' CSV HEADER;"

echo -e "\nCreating table sales_rep..."

sudo -u postgres psql -d posey -c "CREATE TABLE sales_reps (
	id integer,
	name bpchar,
	region_id integer
);"

echo -e "\nLoading csv data into sales_reps..."

sudo -u postgres psql -d posey -c "\copy sales_reps FROM '$folder_path/sales_reps.csv' DELIMITER ',' CSV HEADER;"

echo -e "\nCreating table region..."

sudo -u postgres psql -d posey -c "CREATE TABLE region (
	id integer,
	name bpchar
);"

echo -e "\nLoading csv data into region..."

sudo -u postgres psql -d posey -c "\copy region FROM '$folder_path/region.csv' DELIMITER ',' CSV HEADER;"


echo -e "\nCreating table orders..."

sudo -u postgres psql -d posey -c "CREATE TABLE orders (
	id integer,
	account_id integer,
	occurred_at timestamp,
	standard_qty integer,
	gloss_qty integer,
	poster_qty integer,
	total integer,
	standard_amt_usd numeric(10,2),
	gloss_amt_usd numeric(10,2),
	poster_amt_usd numeric(10,2),
	total_amt_usd numeric(10,2)
);"

echo -e "\nLoading csv data into orders..."

sudo -u postgres psql -d posey -c "\copy orders FROM '$folder_path/orders.csv' DELIMITER ',' CSV HEADER;"

echo -e "\nCreating table accounts..."

sudo -u postgres psql -d posey -c "CREATE TABLE accounts (
	id integer,
	name bpchar,
	website bpchar,
	lat numeric(11,8),
	long numeric(11,8),
	primary_poc bpchar,
	sales_rep_id integer
);"

echo -e "\nLoading csv data into accounts..."

sudo -u postgres psql -d posey -c "\copy accounts FROM '$folder_path/accounts.csv' DELIMITER ',' CSV HEADER;"