# Python Lambda Layers Package Script

This script allows you to generate a AWS Lambda Layer ZIP archive based on Python package requirements.

## Why is this needed?
Some Python packages need to be installed on the same distribution and architecture. This script runs a docker container with the same architecture as AWS Lambdas. You can easily adjust this to work for ARM.

## How it works
- Simply add your dependencies to `requirements.txt` and run `./script.sh`
- A ZIP file `lambda_layer.zip` will be created in your directory
- Upload the ZIP to AWS Lambda as a layer
- You can now use the Python packages you installed
