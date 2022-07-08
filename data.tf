data "aws_vpc" "primary-vpc" {
  default = true
}

data "aws_ami" "ami_os_filter" {
  most_recent = true

  filter {
    name   = "name"
    values = ["${var.purpose}*"]
  }
  owners = ["self"]

}
