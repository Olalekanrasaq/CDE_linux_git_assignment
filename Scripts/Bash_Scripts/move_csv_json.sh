#! /bin/bash

# This bash script will move csv and json files from one folder to another
folder_path="./files_dir"  #path to where the files to move are currently located

# create a directory json_and_csv to move files into
mkdir json_and_csv
echo "Created json_and_csv directory"


# move json and files. The source directory is files_dir
echo -e "\nMoving json and csv files..."
mv $folder_path/*.json $folder_path/*.csv ./json_and_csv/

echo -e "\n Files moved. Confirming..."

# list the files from the json_and_csv folder to confirm it has been moved
cd json_and_csv
ls ./*.json ./*csv
