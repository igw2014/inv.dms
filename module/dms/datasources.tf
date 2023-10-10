data "aws_vpc" "aws_vpc" {
  id = var.aws_vpc_id
}

# data "aws_security_group" "aws_security_group" {
#   id = var.aws_security_group_id
# }

data "aws_subnets" "aws_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.aws_vpc_id]
  }
}