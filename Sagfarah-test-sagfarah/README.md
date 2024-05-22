Here is a detailed README for a Terraform configuration using EC2, S3, and RDS AWS services. It includes sections on security, cost optimization, and a cost breakdown:

# Terraform AWS Infrastructure

This Terraform configuration deploys core infrastructure on AWS, including:

- EC2 instances
- S3 buckets
- RDS database instances

## Security

The infrastructure follows security best practices outlined in the AWS Well-Architected Framework:

**EC2**

- Instances are deployed in private subnets with no public IP, reducing exposure.
- Security groups restrict inbound and outbound traffic to only necessary ports.
- Latest Amazon Linux 2 AMI is used to include all latest security patches.
- EC2 instance profiles provide least privilege access to other AWS services.

**S3**

- Versioning enabled to preserve objects against accidental deletion or overwrite.
- Default encryption enabled for all data at rest.
- Bucket policies restrict access to only authorized users and services.  

**RDS**

- Database deployed in private subnet with security group limiting access.
- Automated backups enabled and retention period set for disaster recovery.
- Encryption at rest ensures confidentiality of sensitive data.
- Database authentication integrated with Identity and Access Management.

## Cost Optimization  

**EC2**

- Reserve Instances used to get significant discounts over on-demand pricing.
- Instance types chosen based on application resource needs for optimal cost.
- Auto Scaling used to match instance count to workload demand.

**S3**

- Lifecycle policies configure transition to Infrequent Access and Glacier to reduce costs.
- Replication enabled to lower-cost S3 storage class when applicable.
- Bucket policies block unintended public access and data transfers.

**RDS**

- Instance sizing and type optimized to application needs to avoid over-provisioning. 
- RDS Reserved Instances purchased when steady-state usage expected.
- Automated multi-AZ deployments disabled where not required to reduce costs.

## Cost Breakdown

**EC2**

- 2 x m5.large instances
   - $0.096 per hour 
   - $4.60 per day
   - $138 per month

**S3** 

- Storage: 50GB 
   - $0.023 per GB/month
   - $1.15 per month

- PUT/COPY/POST requests: 10000
   - $0.005 per 1000 requests  
   - $0.05 per month

**RDS**

- db.t3.medium MySQL instance
   - $0.058 per hour
   - $1.39 per day 
   - $41.70 per month

**Total Monthly Cost: $180.85**