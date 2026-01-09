variable "region" {
  description = "Region for VPC"
  type        = string
  default     = "ap-south-1"
}

variable "vpc" {
  description = "VPC to be created along with cidr"
  type = map(object({
    vpc_cidr = string
    region   = string
    vpc_name = string
    
  }))
  default = {
    VPC1 = {
      vpc_name = "VPC-A"
      region   = "ap-south-1"
      vpc_cidr = "10.10.0.0/16"
    }
    VPC2 = {
      vpc_name = "VPC-B"
      region   = "ap-south-1"
      vpc_cidr = "10.20.0.0/16"
    }
    VPC3 = {
      vpc_name = "VPC-C"
      region   = "ap-south-1"
      vpc_cidr = "10.30.0.0/16"
    }
  }
}

variable "subnets" {
  description = "Map subnets used for TGW"
  type = map(object({
    cidr     = string
    az       = string
    sub_name = string
    vpc_key  = string
  }))
  default = {
    subnet1 = {
      sub_name = "VPC-SNET-A"
      cidr     = "10.10.0.0/24"
      az       = "ap-south-1a"
      vpc_key  = "VPC1"
    }
    subnet2 = {
      sub_name = "VPC-SNET-B"
      cidr     = "10.20.0.0/24"
      az       = "ap-south-1b"
      vpc_key  = "VPC2"
    }
    subnet3 = {
      sub_name = "VPC-SNET-3"
      cidr     = "10.30.0.0/24"
      az       = "ap-south-1c"
      vpc_key  = "VPC3"
    }
  }
}
