variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availablity zone for VPC"
  type = list(string)
  default = ["ap-southeast-1a","ap-southeast-1b","ap-southeast-1c"]
}

variable "public_subnets" {
  description = "Public subnets for VPC"
  type = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "private_subnets" {
    description = "Private subnets for VPC"
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]  
}