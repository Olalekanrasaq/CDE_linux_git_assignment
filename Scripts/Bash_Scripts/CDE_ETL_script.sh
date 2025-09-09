#!/bin/bash

# This bash script will extract a cv file from a url, transformed and load it to a folder.
# The url is declared as an environmental variables in a file ./cron_env
# This file is enabled to be run by the cron job along with this script.

# change directory using absolute path
cd /mnt/c/Users/User/Desktop/CDE_class/Scripts/Bash_Scripts

echo "Extraction started ....."

# create the directory raw to save the extracted file
echo -e "\nCreating directory raw"

mkdir raw

echo -e "\nChange directory to raw folder"

cd raw

# extract csv file from url and save it as data.csv, the url link is an environmental variable
wget -O data.csv $url

# confirm that the file is downloaded into the raw folder
if [[ -f "data.csv" ]]; then
    echo "The file exist in raw folder"
else
    echo "The file does not exist in raw folder"
fi

echo -e "\nExtraction completed successfully!!!"


# Tranformation

echo -e "\nTransformation started ...."

# Rename column Variable_code to variable_code
sed -i  "1s/Variable_code/variable_code/" data.csv

# Create Transformed folder to save transformed csv file
mkdir ../Transformed

# select only the columns: year, Value, Units, variable_code
# csvtool will be used to do the selection of columns rather than cut
# this is because there are embedded commas in the csv fields apart from the standard comma separator
csvtool col 1,5,6,9 data.csv > ../Transformed/2023_year_finance.csv

echo -e "\nTransformation completed!!\n"

# change back to parent directory
cd ..

# confirm that the file is in the folder
if [[ -f "./Transformed/2023_year_finance.csv" ]]; then
    echo "The file exist in the Transformed folder"
else
    echo "The file does not exist in Transformed folder"
fi

# Load the transformed data into a directory named Gold

echo -e "\nLoading started ...."

mkdir Gold

# copy the data from Transformed folder to Gold folder
cp ./Transformed/2023_year_finance.csv ./Gold/

# confirm that the file is in the folder
if [[ -f "./Gold/2023_year_finance.csv" ]]; then
    echo -e "\nThe file exist in the Gold folder"
else
    echo -e "\nThe file does not exist in Gold folder"
fi

echo -e "\nLoading completed!!"