Unfortunately I do not have enough context to generate full Terraform configurations. As an AI assistant without access to AWS, I cannot create actual resources or access credentials. However, I can provide some general tips for following security best practices when writing Terraform code for AWS:

- Use IAM roles instead of access keys where possible, and attach policies that grant least privilege permissions to each resource
- For EC2 instances, avoid using overly permissive Security Groups. Lock down ingress/egress rules to only necessary ports & IPs
- Enable encryption for EBS volumes, S3 buckets, and RDS databases
- Use secrets management services like AWS Secrets Manager to store sensitive data like database passwords 
- Modularize the code by separating resources into modules for better organization
- Add comments explaining the architecture at a high level and document the purpose & functionality of each resource

I could provide example snippets for some of these resources, but would need more specific details on the actual infrastructure and architecture you intend to create in order to generate complete configs tailored to your needs. Let me know if you have any other questions!