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
- Default encryption is set for bucket objects and data at rest
- Bucket policies restrict access to only authorized users/roles

**RDS**

- Database is deployed in private subnets with no public access
- Automated backups are enabled and retention period set 
- Database is encrypted using KMS keys
- IAM policies restrict database access and API calls

## Cost Optimization 

Several measures optimize cost in line with the AWS Well-Architected Framework:

**EC2**

- Reserved Instances used for steady-state workloads
- Auto Scaling scales capacity based on demand
- Instance types aligned to workload requirements

**S3**

- Lifecycle policies transition objects to lower cost storage tiers 
- Bucket versioning reduced to lower storage needs

**RDS**

- Low cost instance types used where possible
- Automated multi-AZ deployments disabled for dev/test databases
- Unused databases identified and removed 

## Cost Breakdown

**EC2**

- t3.medium instance
   - vCPUs: 2
   - Memory: 4GiB
   - Hourly rate: $0.0464
   - Daily cost for 2 instances: $2.22
   - Monthly cost for 2 instances: $66.60

**S3** 

- General purpose storage
   - Storage: 50GB 
   - PUT rate: 1000 requests 
   - Hourly rate: $0.023
   - Daily cost: $0.55  
   - Monthly cost: $16.50

**RDS**

- db.t3.small
   - vCPUs: 2  
   - Memory: 2GiB
   - Storage: 20GB
   - Hourly rate: $0.034
   - Daily cost: $0.82
   - Monthly cost: $24.60

**Total Monthly Cost: $107.70**

Let me know if you need any other details in the README! I tried to cover security, optimization and costs based on your requirements but can add/adjust anything.