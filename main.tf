module "dev-app" {
  source         = "./aws_infra"
  my_env         = "dev"
  ami_id         = "ami-0f5fcdfbd140e4ab7"
  instance_type  = "t2.micro"
  instance_count = 1
}
