
module "ec2" {
  source = "./modules/ec2"
  environment=var.env
}