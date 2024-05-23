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
- Auto Scaling policies optimize provisioning for workload demands.
- Instance types chosen to provide optimal balance of CPU, memory and network.

**S3**

- Lifecycle policies transition less accessed data to lower cost storage tiers. 
- Bucket versioning reduced from 365 days to 30 days standard retention.
- Inventory reports generated monthly and analyzed for optimization opportunities.  

**RDS**

- Aurora database leverages scale-out architecture leading to cost savings.
- Instance sizing and type optimized based on typical utilization metrics.
- Unused databases identified and removed to reduce overhead.

## Cost Breakdown

**EC2** 

- m5.large (2 vCPU, 8GB RAM)
- 12 instances
- 730 hours per month
- $0.096 per instance hour
- Daily cost = 12 * $0.096 = $1.15
- Monthly cost = 730 * 12 * $0.096 = $832  

**S3**

- Storage used: 500 GB 
- PUT requests: 2 million
- GET requests: 4 million 
- Storage cost = $0.023 per GB / month
- PUT cost = $0.005 per 1,000 requests  
- GET cost = $0.0004 per 1,000 requests
- Daily cost = $11.50 (storage) + $10 (PUT) + $1.60 (GET) = $23.10 
- Monthly cost = $345 (storage) + $300 (PUT) + $48 (GET) = $693

**RDS**

- db.t3.medium (2 vCPU, 4 GB RAM)  
- 730 hours per month
- Multi-AZ deployment 
- Storage used: 200 GB
- $0.113 per instance hour
- Storage cost $0.115 per GB / month 
- Daily cost = $0.113 * 24 = $2.71  
- Monthly RDS instance cost = 730 * $0.113 = $82.49
- Monthly storage cost = 200 * $0.115 = $23 
- Total monthly cost = $82.49 + $23 = $105.49

Let me know if you need any clarification or have additional questions!