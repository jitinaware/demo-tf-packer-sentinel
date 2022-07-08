output "external_ip" {
  value = aws_instance.ec2.public_ip
}

output "ami_used" {
  value = data.aws_ami.ami_os_filter.name
}