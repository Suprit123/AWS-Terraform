variable "aws_region" {
  description = "AWS Region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the  VPC"
  type        = string
  default     = "10.100.0.0/16"
}

variable "subnet_cidr" {
  description = "Configuration for all subnets"
  type = map(object({
    cidr        = string
    is_public   = bool
    description = string

  }))
  default = {
    "public" = {
      cidr        = "10.100.0.0/24"
      is_public   = true
      description = "Public Subnet"
    }
    "nat" = {
      cidr        = "10.100.1.0/24"
      is_public   = true
      description = "Nat Gateway Subnet"
    }
    "private" = {
      cidr        = "10.100.11.0/24"
      is_public   = false
      description = "Private Subnet"
    }
  }
}


variable "instance_config" {
  description = "Configuration for EC2 instances "
  type = map(object({
    subnet_key = string
    type       = string
    public_ip  = bool
  }))

  default = {
    "public_vm" = {
      subnet_key = "public"
      type       = "t2.micro"
      public_ip  = true
    }
    "private_vm" = {
      subnet_key = "private"
      type       = "t2.micro"
      public_ip  = false
    }
  }
}


variable "project_name" {
  description = "Project name tag for resources"
  type        = string
  default     = "NetSpecialty-Lab"
}
