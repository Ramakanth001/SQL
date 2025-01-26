#!/bin/bash
# This script is used to rename a DB
# ==============================
# Instructions:
# 1. Save this script as `rename_db.sh`.
# 2. Give execute permission to the script by running:
#    chmod +x rename_db.sh
# 3. Run the script with:
#    ./rename_db.sh
# 4. The script will ask for the following inputs:
#    - MySQL Username
#    - MySQL Password
#    - Current Database Name (the one you want to rename)
#    - New Database Name (the desired new name)
# ==============================

# Prompt for user input
read -p "Enter MySQL Username: " USER
read -sp "Enter MySQL Password: " PASSWORD
echo
read -p "Enter current database name: " OLD_DB
read -p "Enter new database name: " NEW_DB

# Export the old database
echo "Exporting database '$OLD_DB'..."
mysqldump -u $USER -p$PASSWORD $OLD_DB > backup.sql

# Check if export was successful
if [ $? -eq 0 ]; then
    echo "Database exported successfully."
else
    echo "Failed to export the database."
    exit 1
fi

# Create the new database
echo "Creating new database '$NEW_DB'..."
mysql -u $USER -p$PASSWORD -e "CREATE DATABASE $NEW_DB;"

# Import data into the new database
echo "Importing data into '$NEW_DB'..."
mysql -u $USER -p$PASSWORD $NEW_DB < backup.sql

# Check if import was successful
if [ $? -eq 0 ]; then
    echo "Database imported successfully."
else
    echo "Failed to import the database."
    exit 1
fi

# (Optional) Drop the old database
echo "Dropping old database '$OLD_DB'..."
mysql -u $USER -p$PASSWORD -e "DROP DATABASE $OLD_DB;"

echo "Database renamed from '$OLD_DB' to '$NEW_DB' successfully."

