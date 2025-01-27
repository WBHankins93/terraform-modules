#!/bin/bash
ENVIRONMENT=$1
if [[ -z "$ENVIRONMENT" ]]; then
  echo "Usage: $0 <environment>"
  exit 1
fi

cd environments/$ENVIRONMENT || exit
terraform init
