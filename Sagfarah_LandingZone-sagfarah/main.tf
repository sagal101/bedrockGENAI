Here is an example Terraform configuration for AWS services following security best practices:

```hcl
# Configure AWS provider with default region
provider "aws" {
  region = "us-east-1"
}

# EC2 module source 
module "ec2_instances" {
  source = "org/ec2/aws"
  
  # EC2 instance count
  instance_count = 1
  
  # Use IAM role for EC2 instead of access keys 
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
}

# S3 module source
module "s3_buckets" {
  source = "org/s3/aws"

  # S3 bucket name
  bucket_name = "my-s3-bucket"
  
  # Enable encryption on S3 bucket
  enable_encryption = true 
}

# RDS module source
module "rds_instance" {
  source = "org/rds/aws"

  # RDS settings  
  engine            = "mysql"
  engine_version    = "5.7.25"
  
  # Store database credentials in SSM Parameter store
  db_username = data.aws_ssm_parameter.db_username.value
  db_password = data.aws_ssm_parameter.db_password.value
  
  # Use the least privileged IAM role
  iam_role = aws_iam_role.rds_role.name 
}

# IAM module source
module "iam_roles" {
  source = "org/iam/aws"

  # List of IAM roles to create
  roles = [
    {
      name = "ec2_role"
      # Least privilege permissions policy for EC2
    },
    {  
      name = "rds_role"
      # Least privilege permissions for RDS
    }
  ]
}
```

The overall architecture uses IAM roles and least privilege permissions to improve security. Resources like RDS database credentials are stored securely in SSM Parameter Store instead of hardcoded. Modules are used for code organization and reusability. Comments explain the purpose of each major section. Let me know if you would like me to elaborate on any part of this architecture!