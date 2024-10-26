variable "instances" {
  default = [
    "frontend",
    "catalogue",
    "mongodb",
    "cart",
    "user",
    "shipping",
    "payment",
    "mysql",
    "redi",
    "rabbitmq"

  ]
}


resource "aws_instance" "inst" {
  count=length(var.instances)
  ami="ami-09c813fb71547fc4f"
  instance_type="t3.small"
  subnet_id  = "subnet-064c2c91998fc5ef9"
  vpc_security_group_ids=["sg-01024740791e247b2"]
  associate_public_ip_address = true
  tags={
    Name=var.instances[count.index]
  }
}

resource "aws_route53_record" "record" {
  count= length(var.instances)
  zone_id = "Z048101918SLM3R11OGT3"
  name    = "${var.instances[count.index]}-dev.waferhassan.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.inst[count.index].private_ip]
}