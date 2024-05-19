Here is a detailed README for a Terraform configuration using EC2, S3, and RDS AWS services. It includes sections on security, cost optimization, and a cost breakdown:

# Terraform AWS Infrastructure

This Terraform configuration deploys infrastructure on AWS, including:

- EC2 instances
- S3 buckets
- RDS database instances

## Security

The infrastructure follows security best practices from the AWS Well-Architected Framework:

**EC2**

- Instances are deployed in private subnets with no public IP, preventing direct internet access
- Security groups restrict inbound and outbound traffic to only necessary ports and protocols 
- EC2 instance roles provide least privilege access to other AWS services
- EBS volumes are encrypted to protect data at rest

**S3**

- Versioning is enabled to allow for rollback of objects
- Access logging is enabled to audit access requests 
- Bucket policies restrict access to only authorized users and services
- Default encryption is enabled to encrypt objects at rest

**RDS**

- Database instances are deployed in private subnets with no public access
- Security groups restrict access to only authorized resources
- Encryption at rest is enabled to encrypt databases
- Automated backups allow for point-in-time recovery 

## Cost Optimization

To optimize costs based on the Well-Architected Framework, the following practices are implemented:

**EC2**

- Reserved Instances used for steady-state workloads to reduce hourly charges
- Auto Scaling to match instance count to workload demand
- Instance types chosen to provide optimal compute, memory and network

**S3**

- Lifecycle policies transition less accessed data to lower cost storage tiers 
- Versioning limited to last 5 versions to reduce storage footprint

**RDS**

- Reserved DB Instances used for production workloads
- Auto Scaling used to match read replicas to workload demand
- Aurora Serverless used for development workloads to optimize costs

## Cost Breakdown

**EC2**

- 2 x m5.large (On-Demand): 
    - $0.096 per Hour 
    - $4.60 per day
    - $138 per month

- 1 x m5.xlarge (Reserved Instance):
    - $0.126 per Hour
    - $3.00 per day  
    - $90 per month

**S3** 

- Storage: $0.023 per GB per month
    - Estimated 50GB per month
    - $1.15 per month

- PUT and GET requests: $0.005 per 1,000 requests  
    - Estimated 100,000 requests per month 
    - $0.50 per month

**RDS**

- 1 x db.r5.large (Reserved Instance):
    - $0.126 per Hour
    - $3.00 per day
    - $90 per month

- 1 x db.t3.medium (Serverless):
    - $0.058 per Hour 
    - Estimated $1.45 per day
    - $43.50 per month

**Total Monthly Cost Estimate**

- EC2: $228
- S3: $1.65  
- RDS: $133.50

**Total: $363.15 per month**