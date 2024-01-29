#!/bin/bash

aws_region="us-east-1"
if [[ $? != 0 ]]
  then
    echo "Something wrong while getting aws default region, now exiting..."
    exit 1
fi

cd ./packer/

packer build ubuntu-ami.json
if [[ $? != 0 ]]
  then
    echo "Something wrong while executing packer build, now exiting..."
    exit 1
fi

cd ../terraform/

terraform init
if [[ $? != 0 ]]
  then
    echo "Something wrong while executing terraform init, now exiting..."
    exit 1
fi

terraform plan
if [[ $? != 0 ]]
  then
    echo "Something wrong while executing terraform plan, now exiting..."
    exit 1
fi

terraform apply -auto-approve
if [[ $? != 0 ]]
  then
    echo "Something wrong while executing terraform apply, now exiting..."
    exit 1
fi

URL=$(terraform output instance_url)

if [[ $? != 0 ]]
  then
    echo "Something wrong while getting game URL, now exiting..."
    exit 1
fi

# Remove double quotes from the URL
URL=$(echo $URL | tr -d '"')

echo "Instance URL is: http://${URL}"