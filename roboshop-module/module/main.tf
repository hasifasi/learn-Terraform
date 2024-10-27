resource "aws_instance" "inst" {

  ami="ami-09c813fb71547fc4f"
  instance_type="t3.small"
  subnet_id = "subnet-012206b4eaf203149"
  vpc_security_group_ids=["sg-06ced1a36abc550ee"]
  associate_public_ip_address = true
  tags={
    Name=var.component_name
  }
}

resource "aws_route53_record" "record" {

  zone_id = "Z013949914BHV8C6XLNPP"
  name    = "${var.component_name}-dev.waferhassan.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.inst.private_ip]
}

variable "component_name" {}