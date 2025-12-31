variable "vpc_cidr" {
  description = "CIDR of the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "region" {
  description = "Region for VPC"
  type        = string
  default     = "ap-south-1"
}

variable "subnets" {
  type = map(object({
    cidr = string
    az   = string
    name = string
  }))
  description = "Map of subnet configurations"
  default = {
    subnet1 = {
      name = "app-pvt1"
      cidr = "10.10.1.0/24"
      az   = "ap-south-1a"
    }
    subnet2 = {
      name = "app-pvt2"
      cidr = "10.10.2.0/24"
      az   = "ap-south-1b"
    }
    subnet3 = {
      name = "ec2-ep-pvt"
      cidr = "10.10.0.0/24"
      az   = "ap-south-1a"
    }
  }
}

variable "instance_type" {
  description = "Instance type that needs to be created"
  type        = string
  default     = "t2.micro"
}