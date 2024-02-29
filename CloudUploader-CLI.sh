#!/bin/bash

# A script that quickly upload files to Azure

# File to Upload
file_path=$1

# Check if file_path is provided

if [ -z "$file_path" ]; then
  echo "Missing argument"
  echo "Usage: $0 <file_path>"
  exit 1
fi

# Check if Azure CLI is installed
if ! command -v az &> /dev/null; then
    echo "Azure CLI is not installed. Please install it first."
    exit 1
else
    # Gets Azure arguments from the user

    echo -n "Plz enter account name : "
    read storage_account
    echo -n "Plz enter storage account key : "
    read account_key
    echo -n "Plz enter container account name : "
    read container_name
fi

# Authenticate with Azure CLI
az login

# Upload the file to Azure Blob Storage
az storage blob upload \
  --account-name $storage_account \
  --account-key $storage_account_key \
  --container-name $container_name \
  --file $file_path

# Check if upload was successful
if [ $? -eq 0 ]; then
  echo "File uploaded successfully to Azure Blob Storage"
else
  echo "Error: Failed to upload file to Azure Blob Storage"
fi
