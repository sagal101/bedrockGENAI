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
- Bucket policies block unintended public access and traffic spikes.

**RDS**

- Instance sizing and type optimized to application workload. 
- Read replicas deployed for read-heavy workloads to reduce main DB load.
- Automated backups configured with shorter retention to minimize backup storage.

## Cost Breakdown

**EC2**

- Instance Type: t3.medium
- Instance Hours per Day: 24 
- Hourly Cost: $0.0416
- Daily Cost: $1.00  
- Monthly Cost for 2 instances: $60

**S3** 

- Storage per Month: 500 GB  
- Monthly Storage Cost at $0.023 per GB: $11.50

**RDS**

- Instance Type: db.t3.small
- Instance Hours per Day: 24
- Hourly Cost: $0.017
- Daily Cost: $0.41
- Monthly Cost: $12.30

**Total Monthly Cost: $83.80**

Let me know if you need any other details in the README! I tried to cover best practices for security, optimization, and costs across the AWS services.