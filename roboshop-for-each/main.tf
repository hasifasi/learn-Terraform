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
  vpc_security_group_ids=["sg-095c9d6609b27bb7b"]
  tags={
    Name=each.key
  }
}

resource "aws_route53_record" "record" {
  for_each = var.instances
  zone_id = "Z048101918SLM3R11OGT3"
  name    = "${each.key}-dev.waferhassan.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.inst[each.key].private_ip]
}