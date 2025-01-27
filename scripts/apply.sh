#!/bin/bash
PROVIDER=$1
ENVIRONMENT=$2

if [[ $PROVIDER == "aws" ]]; then
  cd environments/aws/$ENVIRONMENT
elif [[ $PROVIDER == "ibmc" ]]; then
  cd environments/ibmc/$ENVIRONMENT
else
  echo "Unknown provider: $PROVIDER"
  exit 1
fi

terraform apply -var-file=terraform.tfvars
