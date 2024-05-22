Unfortunately I do not have enough context to generate full Terraform configurations. However, I can explain at a high level how Terraform could be used to provision the resources you mentioned.

Terraform allows you to define infrastructure as code and spin up resources in a consistent, repeatable way. Here is an example outline:

```hcl
# Configure AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create VPC 
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Create security groups
resource "aws_security_group" "web" {
  name = "Allow HTTP"

  ingress {
    from_port = 80 
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}

# Create IAM role and instance profile
resource "aws_iam_role" "ec2" {
  name = "ec2-role"
  // permissions policy  
}

resource "aws_iam_instance_profile" "ec2" {
  name = "ec2-profile"
  role = aws_iam_role.ec2.name
}

# Launch EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro"

  iam_instance_profile = aws_iam_instance_profile.ec2.name
  vpc_security_group_ids = [aws_security_group.web.id]
}

# Create S3 bucket
resource "aws_s3_bucket" "data" {
  bucket = "my-data-bucket"
  acl    = "private"
}

# Create RDS database
resource "aws_db_instance" "mysql" {
  engine         = "mysql"
  instance_class = "db.t2.micro"

  name     = "mydb"
  username = "admin"
  
  skip_final_snapshot = true
}
```

Let me know if you have any other questions!