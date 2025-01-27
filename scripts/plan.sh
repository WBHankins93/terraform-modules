#!/bin/bash

# Usage: ./plan.sh <provider> <environment>
PROVIDER=$1
ENVIRONMENT=$2

if [[ -z "$PROVIDER" || -z "$ENVIRONMENT" ]]; then
  echo "Usage: $0 <provider> <environment>"
  exit 1
fi

# Navigate to the correct environment directory
if [[ $PROVIDER == "aws" ]]; then
  ENV_DIR="environments/aws/$ENVIRONMENT"
elif [[ $PROVIDER == "ibmc" ]]; then
  ENV_DIR="environments/ibmc/$ENVIRONMENT"
else
  echo "Unknown provider: $PROVIDER"
  exit 1
fi

if [[ ! -d "$ENV_DIR" ]]; then
  echo "Environment directory $ENV_DIR does not exist!"
  exit 1
fi

cd $ENV_DIR || exit

# Initialize Terraform
echo "Initializing Terraform..."
terraform init -input=false

# Validate Terraform configuration
echo "Validating Terraform configuration..."
terraform validate
if [[ $? -ne 0 ]]; then
  echo "Terraform validation failed!"
  exit 1
fi

# Plan Terraform configuration
echo "Planning Terraform configuration for $PROVIDER in $ENVIRONMENT..."
terraform plan -var-file=terraform.tfvars -out=tfplan
if [[ $? -ne 0 ]]; then
  echo "Terraform plan failed!"
  exit 1
fi

echo "Terraform plan completed successfully. Plan saved to 'tfplan'."
