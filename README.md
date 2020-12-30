# aws-cloudformation-ecs-poc-simple

## How to deploy

1. Click URL with location of template
   Example: [https://console.aws.amazon.com/cloudformation/home#/stacks/new?stackName=senzing-poc&templateURL=https://s3-external-1.amazonaws.com/cf-templates-xoqvergspzx7-us-east-1/2020365v5b-cloudformation.yaml](https://console.aws.amazon.com/cloudformation/home#/stacks/new?stackName=senzing-poc&templateURL=https://s3-external-1.amazonaws.com/cf-templates-xoqvergspzx7-us-east-1/2020365v5b-cloudformation.yaml)
1. Click "Next" button.
1. In "Parameters" section:
    1. Agrees to EULA
    1. Optionally adds Senzing License (base64 encoded)
    1. Enters Security CIDR  (This is a tricky step)
1. Click "Next" button.
1. Click "Next" button again.
1. In "Capabilities" section:
    1. Check "[x] I acknowledge that AWS CloudFormation might create IAM resources."
1. Click "Create stack" button.

## Using deployment

1. Visit [AWS CloudFormation console](https://console.aws.amazon.com/cloudformation/home).
    1. Make sure correct AWS region is selected.
1. Wait until "senzing-poc" status is `CREATE_COMPLETE`.
    1. May have to hit the refresh button a few times to get updated information.
1. Click on "senzing-poc" stack
1. Click on "Outputs" tab
1. Click on "WebAppUrl" value

## Behind the scenes

### What Cloudformation does

1. Provisions:
    1. AWS infrastructure: VPC, subnets, Internet Gateway, Routes, IAM Roles and Policies, Logging
    1. AWS: EFS, SQS, 3 - AWS Aurora Postgres Serverless databases, ECS
    1. Senzing: Stream-loader (with autoscale), Redoer, API Server, Entity Search Web App

### What is not supported

1. What this doesn't support (i.e. what you don't get):
    1. Specification of existing AWS resources
        1. VPC, Subnets, RDS, SQS
    1. WithInfo information
