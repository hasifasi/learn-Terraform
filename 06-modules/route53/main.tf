resource "aws_route53_record" "record" {
  zone_id = "Z02249652EM5BAO495DZ1"
  name    = "${var.instance_name}-dev.rdevopsb81.online"
  type    = "A"
  ttl     = "30"
  records = [var.ip_address]
}

variable "instance_name" {}

variable "ip_address" {}