#!/bin/bash

# Variables
BUCKET_NAME="s3://your-bucket-name"
TARGET_PATH="your/target/path"  # Optional
FILES_TO_UPLOAD=(
  "README.md"
  "scripts"
  "hashicorp-packer"
  "configurationmgmt"
  "hashicorp-terraform"
  "webconfig"
)

# Upload files/folders
for item in "${FILES_TO_UPLOAD[@]}"; do
  if [ -e "$item" ]; then
    echo "Uploading $item to S3..."
    aws s3 cp "$item" "$BUCKET_NAME/$TARGET_PATH/$item" --recursive
  else
    echo "Warning: $item not found!"
  fi
done
