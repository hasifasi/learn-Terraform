resource "aws_instance" "test" {
  ami= data.aws_ami.example.id
  instance_type="t3.small"
  subnet_id = "subnet-012206b4eaf203149"
  vpc_security_group_ids=[data.aws_security_group.sg.id]
  associate_public_ip_address = true
  tags={
    Name="test"
  }
}

data "aws_ami" "example" {
  most_recent = true
  name_regex  = "RHEL-9-DevOps-Practice"
  owners = ["973714476881"]

}



data "aws_security_group" "sg" {
  name="allow-all"
}
