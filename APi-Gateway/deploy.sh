#! /bin/bash

terraform init
terraform apply --auto-approve

echo "http://localhost:4566/restapis/<Rest-api-id>/test/_user_request_/test"