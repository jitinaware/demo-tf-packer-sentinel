

variable "region" {
  description = "AWS region"
  default     = "us-east-2"
}

variable "aws_allow_cidr_range" {
  type    = string
  default = "0.0.0.0/0"
}

variable "aws_instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "amifilter_owner" {
  type    = string
  default = "self"
}

variable "purpose" {
  type    = string
  default = "demo-tf-packer"
}