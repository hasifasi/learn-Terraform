resource "aws_instance" "frontend" {
    ami="ami-09c813fb71547fc4f"
    instance_type="t3.small"
    vpc_security_group_ids=["sg-095c9d6609b27bb7b"]
    tags={
        Name="frontend"
        }
    }

resource "aws_instance" "catalogue" {
    ami="ami-09c813fb71547fc4f"
    instance_type="t3.small"
    vpc_security_group_ids=["sg-095c9d6609b27bb7b"]
    tags={
        Name="frontend"
        }
    }