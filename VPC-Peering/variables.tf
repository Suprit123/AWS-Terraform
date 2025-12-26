variable "mumbai_vpc_name" {
  description = "Name tag for Mumbai VPC"
  type        = string
  default     = "Mumbai-VPC"
}

variable "mumbai_cidr" {
  description = "CIDR block for Mumbai VPC"
  type        = string
  default     = "10.100.0.0/16"
}

variable "mumbai_subnet_cidr" {
  description = "CIDR block for Mumbai Subnet"
  type        = string
  default     = "10.100.1.0/24"
}

variable "virginia_vpc_name" {
  description = "Name tag for Virginia VPC"
  type        = string
  default     = "Virginia-VPC"
}

variable "virginia_cidr" {
  description = "CIDR block for Virginia VPC"
  type        = string
  default     = "10.200.0.0/16"
}

variable "virginia_snet_cidr" {
  description = "CIDR block for Virginia Subnet"
  type        = string
  default     = "10.200.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
