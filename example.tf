# Hardcoded credentials
variable "db_password" {
  default = "admin123"
}

variable "api_key" {
  default = "sk-1234567890abcdef"
}

# AWS credentials hardcoded
provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAIOSFODNN7EXAMPLE"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}

# Security group with overly permissive rules
resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Example security group"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Wide open to the internet
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# S3 bucket without encryption
resource "aws_s3_bucket" "example" {
  bucket = "my-bucket-name"
  acl    = "public-read"  # Publicly accessible

  # Missing: server_side_encryption_configuration
}

# EC2 instance without encryption
resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 40
  encrypted         = false  # Not encrypted
}

# RDS instance with weak password
resource "aws_db_instance" "example" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "password123"  # Weak password
  parameter_group_name = "default.mysql5.7"
  publicly_accessible  = true  # Publicly accessible
  skip_final_snapshot  = true
}

# Missing tags
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  
  # Missing tags for resource management
}

# Using deprecated syntax
resource "aws_instance" "deprecated" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  
  # Old style syntax
}

# No backup configuration
resource "aws_db_instance" "no_backup" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  backup_retention_period = 0  # No backups
}

# Missing lifecycle policies
resource "aws_s3_bucket" "no_lifecycle" {
  bucket = "bucket-without-lifecycle"
}

# Not using variables for repeated values
resource "aws_instance" "hardcoded" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_class = "t2.micro"
  subnet_id     = "subnet-12345"  # Hardcoded
}
