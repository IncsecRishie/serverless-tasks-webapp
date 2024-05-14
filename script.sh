#!/bin/bash

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# Install Node.js LTS version
nvm install 'lts/iron'
nvm alias default 'lts/iron'

# Check Node.js version
node --version

# Navigate to environment directory
cd ~/environment

# Clone the serverless-tasks-webapp repository
git clone https://github.com/IncsecRishie/serverless-tasks-webapp

# Update system packages
sudo yum update -y

# Install AWS SAM CLI
wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
sudo ./sam-installation/install --update

# Check SAM CLI version
sam --version

# Navigate to serverless-tasks-webapp directory
cd serverless-tasks-webapp

# Execute resize script
bash resize.sh 20

# Check disk usage
df -h

# Install AWS Amplify CLI
npm i -g @aws-amplify/cli

# Install xdg-utils
sudo yum -y install xdg-utils

# Update system packages again
sudo yum update -y

# Re-install AWS SAM CLI (in case it got updated during system update)
wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
sudo ./sam-installation/install --update

# Navigate to SAM directory
cd ~/environment/serverless-tasks-webapp/sam

# Build SAM application
sam build

# Deploy SAM application
sam deploy --guided

# Navigate to webapp directory
cd ~/environment/serverless-tasks-webapp/webapp

# Initialize Amplify project
amplify init

# Install dependencies
npm install

# Build web application
npm run build

# Add hosting to Amplify
amplify add hosting

# Publish Amplify application
amplify publish
