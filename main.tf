

resource "aws_security_group" "sg" {
  name   = "${var.purpose}-sg"
  vpc_id = data.aws_vpc.primary-vpc.id
  egress = [
    {
      cidr_blocks      = [var.aws_allow_cidr_range, ]
      description      = "Outbound to Internet"
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress = [
    {
      cidr_blocks      = [var.aws_allow_cidr_range, ]
      description      = "HTTP rule"
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
    },
    {
      cidr_blocks      = [var.aws_allow_cidr_range, ]
      description      = "SSH rule"
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
  ]
}

resource "aws_instance" "ec2" {
  #ami = "ami-"
  ami = data.aws_ami.ami_os_filter.id

  instance_type = var.aws_instance_type
  #key_name = var.aws_keyname

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 40
  }

  vpc_security_group_ids = [aws_security_group.sg.id]
}