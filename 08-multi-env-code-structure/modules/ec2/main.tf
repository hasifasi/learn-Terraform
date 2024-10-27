resource "aws_instance" "inst" {
  ami="ami-09c813fb71547fc4f"
  instance_type="t3.small"
  subnet_id = "subnet-0939b3849d80205c1"
  vpc_security_group_ids=["sg-09927bac25e192355"]
  associate_public_ip_address = true
  tags={
    Name="test-${var.environment}"
  }
}

variable "environment" {}