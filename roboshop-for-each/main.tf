variable "instances" {
  default ={
    frontend={}
    cart = {}
    catalogue = {}
    user = {}
    shipping = {}
    payment = {}
    mysql = {}
    mongodb = {}
    rabbitmq = {}
    redis = {}
  }

}

resource "aws_instance" "inst" {
  for_each = var.instances
  ami="ami-09c813fb71547fc4f"
  instance_type="t3.small"
  subnet_id = "subnet-012206b4eaf203149"
  vpc_security_group_ids=["sg-06ced1a36abc550ee"]
  associate_public_ip_address = true
  tags={
    Name=each.key
  }
}

resource "aws_route53_record" "record" {
  for_each = var.instances
  zone_id = "Z013949914BHV8C6XLNPP"
  name    = "${each.key}-dev.waferhassan.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.inst[each.key].private_ip]
}