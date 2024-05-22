Unfortunately I do not have enough context to generate full CloudFormation templates for you. However, I can offer some general tips for creating secure and scalable infrastructure as code with CloudFormation:

- Use IAM roles instead of access keys where possible. Grant least privilege permissions.
- Parameterize things like instance types, VPC CIDR ranges, etc to make templates reusable.
- Leverage CloudFormation mappings to set up application tiers with different resource requirements.
- Implement autoscaling groups with load balancers instead of fixed EC2 fleets.
- Store sensitive data like passwords in AWS Secrets Manager and reference in templates.
- Enable encryption for data stores like EBS volumes, S3 buckets, and RDS databases. 
- Add tagging standards for cost allocation and automation.
- Separate infrastructure from application deployment using nested stacks.
- Validate templates against best practices with tools like cfn-nag.

Without more details on your specific architecture needs, I cannot generate full templates for you. Please provide more details on the AWS services you want to deploy, connectivity between layers, scaling needs, and any special security considerations. I'm happy to help guide you through best practices in infrastructure as code.