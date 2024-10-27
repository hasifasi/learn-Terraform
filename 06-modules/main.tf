variable "instances" {
  default=[
  "test1",
  "test2"
  ]
}



module "ec2" {
  count=length(var.instances)
  source = "./ec2"
  instance_name = var.instances[count.index]
}

output "ip" {
  value=module.ec2
}


module "route53" {

  count = length(var.instances)
  source = "./route53"
  instance_name = var.instances[count.index]
  ip_address =  module.ec2[count.index].ip_address
}

# This is understand how 2 modules are depend on each other
# Here route53 module is depend on module ec2 for the ip address.. becoz ip are generated dynamically after the resouce is created
# Once it created it will pass the ip to route 53