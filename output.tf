output "my_ec2_ip" {
  value = aws_instance.my_instance.public_ip
}