Automated AWS Deployment Workflow with Packer, Docker, and Terraform for EC2 Instances (classwork 20-01-24)

Overview
This project demonstrates the process of creating a new Amazon Machine Image (AMI) using Packer, deploying a Dockerized application on the newly created AMI, and provisioning an EC2 instance with Terraform. The entire workflow is automated using a shell script.

After following the steps in the workflow, you can access the deployed application by opening the specified URL. The application will display the following content:
Hello Blog post #1
Hello Blog post #2
Hello Blog post #3
Hello Blog post #4

Running the Application
  Go to the "Actions" tab in your GitHub repository and run the workflow file provision_ec2.yaml. This workflow will automate the deployment process and configure the application on the provisioned EC2 instance.


Project Structure
  The repository is organized into three main folders:
  1.ansible: Contains Ansible playbook file
  2.packer: Contains Packer configurations for creating a new AMI.
  3.terraform: Contains Terraform configurations for provisioning an EC2 instance.

Workflow Steps
  Create AMI with Packer
  This AMI will be used as the base for the EC2 instance.

Run Docker on AMI
  After creating the AMI, use the Docker files located in the docker folder to set up the required environment on the newly created AMI. This ensures that the Dockerized application can run seamlessly.

Provision EC2 Instance with Terraform
  Navigate to the terraform folder and follow the instructions in the README to provision an EC2 instance on AWS using Terraform. Specify the previously created AMI as the base image for the instance.

Run Deployment Script
  Once the EC2 instance is provisioned, use the deploy_application.sh script in the main project folder to execute all necessary actions for deploying the application.

Repository Secrets
  To successfully execute the workflows and perform actions on AWS, you need to add the following secrets to your GitHub repository. These secrets will be securely used during the workflow runs.

1.AWS_ACCESS_KEY_ID: The AWS access key ID associated with an IAM user or role that has the necessary permissions for Packer, Terraform, and EC2 instance provisioning.

2.AWS_SECRET_ACCESS_KEY: The corresponding secret access key for the provided AWS access key ID.

3.AWS_REGION: The AWS region where the resources will be created (e.g., us-east-1, eu-west-2). Ensure that the specified region is supported by the services used in this project.

Adding Secrets to Your Repository
  Follow these steps to add secrets to your GitHub repository:
  1.Navigate to your GitHub repository.
  2.Click on the “Settings” tab.
  3.In the left sidebar, click on “Secrets.”
  4.Click on “New repository secret.”
  5.Add the secrets:

These secrets will be automatically utilized by the GitHub Actions workflows to authenticate and interact with AWS services during the CI/CD process.
