resource "aws_instance" "frontend" {
    ami="ami-09c813fb71547fc4f"
    instance_type="t3.small"
    vpc_security_group_ids=["sg-095c9d6609b27bb7b"]
    tags={
        Name="frontend"
        }
    }

resource "aws_route53_record" "frontend" {
  zone_id = "Z048101918SLM3R11OGT3"
  name    = "frontend-dev.waferhassan.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "catalogue" {
    ami="ami-09c813fb71547fc4f"
    instance_type="t3.small"
    vpc_security_group_ids=["sg-095c9d6609b27bb7b"]
    tags={
        Name="catalogue"
        }
    }

resource "aws_route53_record" "catalogue" {
  zone_id = "Z048101918SLM3R11OGT3"
  name    = "catalogue-dev.waferhassan.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}