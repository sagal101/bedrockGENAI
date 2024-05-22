Here is a detailed README for a CloudFormation configuration using EC2, S3, and RDS:

# CloudFormation Stack - EC2, S3, RDS

## Overview

This CloudFormation stack sets up the following AWS resources:

- EC2 Instance - t2.micro instance running Amazon Linux 2
- S3 Bucket - General purpose S3 bucket with default settings 
- RDS Database Instance - db.t2.micro MySQL database instance

## Security

Security has been configured according to the AWS Well-Architected Framework principles:

**Identity and Access Management**

- EC2 instance runs with an IAM role granting least privilege access to other AWS services
- RDS database is not publicly accessible and only allows connections from the EC2 instance

**Detective Controls**

- CloudTrail is enabled to log API calls to the AWS account
- CloudWatch metrics and alarms have been configured for critical resources

**Infrastructure Protection**

- Resources are created inside a Virtual Private Cloud (VPC) for network isolation
- Security groups restrict inbound and outbound network traffic

**Data Protection**

- EBS volumes and RDS database are encrypted at rest using KMS
- S3 bucket has versioning enabled

## Cost Optimization

**Right Sizing**

- t2 instance types and db.t2 database instances chosen over larger models
- EBS General Purpose SSD (gp2) chosen as the storage type

**Purchasing Options** 

- Reserved Instances can be purchased for steady state EC2 usage
- Convertible RIs can be used to allow flexibility

**Monitoring**

- Billing alerts can be set up in CloudWatch to detect anomalies
- Cost Explorer can track spends and usage trends

## Cost Breakdown

**EC2**

- t2.micro (Linux) instance
    - vCPUs: 1 
    - Memory: 1GiB  
    - Hourly Rate: $0.0116
    - Daily Cost: $0.28 
    - Monthly Cost: $8.4

**S3**

- Storage: $0.023 per GB 
- PUT, COPY, POST, LIST requests: $0.005 per 1,000 requests
- GET, SELECT, and all other requests: $0.0004 per 1,000 requests

**RDS**

- db.t2.micro MySQL instance
    - vCPUs: 1
    - Memory: 1GiB 
    - Storage: 20GB
    - Hourly Rate: $0.017
    - Daily Cost: $0.41
    - Monthly Cost: $12.3

This covers the key details of the CloudFormation stack architecture, security, optimization and estimated costs. Let me know if you need any clarification or have additional questions!