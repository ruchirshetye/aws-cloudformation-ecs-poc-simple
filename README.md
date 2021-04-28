# aws-cloudformation-ecs-poc-simple

## Synopsis

The `aws-cloudformation-ecs-poc-simple` demonstrates a Senzing deployment using an AWS Cloudformation template.

Detailed instructions at
[hub.senzing.com/aws-cloudformation-ecs-poc-simple](http://senzing.github.io/aws-cloudformation-ecs-poc-simple)

## How to deploy without much thinking

1. :warning: **Warning:** This Cloudformation deployment will accrue AWS costs.
   With appropriate permissions, the
   [AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/)
   can help evaluate costs.
1. Visit [AWS Cloudformation with Senzing template](https://console.aws.amazon.com/cloudformation/home#/stacks/new?stackName=senzing-poc&templateURL=https://s3.amazonaws.com/public-read-access/aws-cloudformation-ecs-poc-simple/cloudformation.yaml)
1. At lower-right, click on "Next" button.
1. In **Specify stack details**
    1. In **Parameters**
        1. In **Security responsibility**
            1. Understand the nature of the security in the deployment.
            1. Once understood, enter "I AGREE".
        1. In **Senzing installation**
            1. Accept the End User License Agreement
        1. In **Security**
            1. Enter your email address.  Example: `me@example.com`
    1. Other parameters are optional.
    1. At lower-right, click "Next" button.
1. In **Configure stack options**
    1. At lower-right, click "Next" button.
1. In **Review senzing-poc**
    1. Near the bottom, in **Capabilities**
        1. Check ":ballot_box_with_check: I acknowledge that AWS CloudFormation might create IAM resources."
    1. At lower-right, click "Create stack" button.

## A Hack

Unfortunately, the AWS Cloudformation template does not support a particular parameter for the AWS Aurora Postgres Serverless database
that is needed in this stack.
To work around this limitation, see
[How to set AWS RDS force-scaling-capacity](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/set-aws-rds-force-scaling-capacity.md).
If possible, add a "thumbs" up to
[AWS Cloudformation issue #298](https://github.com/aws-cloudformation/aws-cloudformation-coverage-roadmap/issues/298)
to draw attention to this AWS Cloudformation defect.

## Using deployment

1. Visit [AWS CloudFormation console](https://console.aws.amazon.com/cloudformation/home).
    1. Make sure correct AWS region is selected.
1. Wait until "senzing-poc" status is `CREATE_COMPLETE`.
    1. Senzing formation takes about 15 minutes to fully deploy.
    1. May have to hit the refresh button a few times to get updated information.
1. Click on "senzing-poc" stack.
1. Click on "Outputs" tab.
1. Open the "0penFirst" value in a new web browser tab or window.
    1. Because this uses a self-signed certificate, a warning will come up in your browser.  Simply continue.
    1. In the "Sign in with your email and password" dialog box, enter the *UserName* and *UserInitPassword*
       values seen in the "Output" tab of the "senzing-poc" stack.  This is a one-time password.
    1. In **Change Password**, enter a new password.

## Additional topics

1. [How to load AWS Cloudformation queue](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/load-aws-cloudformation-queue.md)
1. [How to set AWS RDS force-scaling-capacity](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/set-aws-rds-force-scaling-capacity.md)
1. [How to migrate Senzing in AWS Cloudformation](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/migrate-senzing-in-cloudformation.md)
1. [How to update Senzing license](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/update-senzing-license.md)
1. [How to migrate an AWS RDS database](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/migrate-aws-rds-database.md)

## Behind the scenes

### What Cloudformation does

1. Provisions:
    1. AWS infrastructure: VPC, subnets, Internet Gateway, Routes, IAM Roles and Policies, Logging
    1. AWS: EFS, 3 SQS queues, 3 AWS Aurora Postgres Serverless databases, ECS, Cognito
    1. Senzing: Stream-loader, Redoer, API Server, Entity Search Web App

### What is not supported

1. What this doesn't support (i.e. what you don't get):
    1. Specification of existing AWS resources
        1. VPC, Subnets, RDS, SQS
