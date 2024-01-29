#!/bin/bash

# Change directory to packer/
cd ./packer/ || exit 1

# Build AMI using Packer
packer build ubuntu-ami.json
if [[ $? -ne 0 ]]; then
  echo "Error: Packer build failed. Exiting..."
  exit 1
fi

# Change directory back to the project root
cd ..

# Change directory to terraform/
cd ../terraform/ || exit 1

# Initialize Terraform
terraform init
if [[ $? -ne 0 ]]; then
  echo "Error: Terraform initialization failed. Exiting..."
  exit 1
fi

# Display Terraform plan
terraform plan
if [[ $? -ne 0 ]]; then
  echo "Error: Terraform plan generation failed. Exiting..."
  exit 1
fi

# Apply Terraform changes
terraform apply -auto-approve
if [[ $? -ne 0 ]]; then
  echo "Error: Terraform apply failed. Exiting..."
  exit 1
fi

# Get the instance URL from Terraform output
URL=$(terraform output instance_url)

# Ensure the URL is retrieved successfully
if [[ $? -ne 0 ]]; then
  echo "Error: Unable to retrieve the instance URL. Exiting..."
  exit 1
fi

# Remove double quotes from the URL
URL=$(echo "$URL" | tr -d '"')

echo "Deployment completed successfully."
echo "Instance URL: http://${URL}"
