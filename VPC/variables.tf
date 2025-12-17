variable "aws_region" {
  description = "AWS Region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the main VPC"
  type        = string
  default     = "10.100.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public and private subnet"
  type = map(object({
    cidr_block = string
    public     = bool
  }))

  default = {
    public_subnet = {
      cidr_block = "10.100.0.0/24"
      public     = true
    }
      private_subnet = {
        cidr_block = "10.100.11.0/24"
        public     = false
      }
    }
  }


variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "project_name" {
  description = "Project name tag for resources"
  type        = string
  default     = "NetSpecialty-Lab"
}
