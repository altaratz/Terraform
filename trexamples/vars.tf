variable "region" {
    default = "us-east-1"
}
variable "vpc_cidr" {
    default = "190.160.0.0/16"
}
variable "vpc_subnet_cidr" {
    type = "list"
    default = ["190.160.1.0/24","190.160.2.0/24","190.160.3.0/24"]
}
# variable "azs" {
#     type = "list"
#     default = ["us-east-1a","us-east-1b","us-east-1c"]
# }

# Declare the data source

data "aws_availability_zones" "azs" {}