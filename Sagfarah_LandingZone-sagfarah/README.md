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
- EBS volumes are encrypted and snapshots are enabled for backup/recovery

**S3**

- Versioning is enabled to preserve previous versions of objects
- Default encryption is set for bucket objects and backups
- Bucket policies restrict access to only authorized users/roles

**RDS**

- Database is deployed in private subnets with security groups restricting access
- Automated backups are enabled and retention period set 
- Database is encrypted at rest using KMS keys
- Database authentication integrated with IAM roles for access control

## Cost Optimization 

Several measures optimize cost in line with the AWS Well-Architected Framework:

**EC2**

- Reserved Instances used for steady-state workloads to reduce compute costs
- Auto Scaling optimizes instance counts to meet demand and reduce over-provisioning
- Instance types aligned to workload requirements  

**S3**

- Lifecycle policies transition less accessed data to lower cost storage tiers 
- Bucket versioning limited to last 5 versions to reduce storage footprint

**RDS**

- Low cost instance types like T3 used for dev/test databases
- RDS Reserved Instances purchased for production databases
- Automated multi-AZ deployments disabled for non-critical databases

## Cost Breakdown

**EC2**

- m5.large (2 vCPU, 8GB RAM) on-demand instance: $0.192 per Hour, $4.60 per Day, $138 per Month
- Total for 3 instances = $12.50 per Day, $414 per Month

**S3** 

- Storage: $0.023 per GB per month
- Assuming 500GB usage across buckets = $11.5 per Month

**RDS**

- db.t3.medium MySQL database instance: $0.058 per Hour, $1.40 per Day, $42 per Month
- Total for 2 database instances = $84 per Month  

**Total Monthly Cost = $414 (EC2) + $11.5 (S3) + $84 (RDS) = $509.5**

This covers the major components of the infrastructure. Let me know if you need any sections expanded or have additional questions!