resource "aws_instance" "test" {
  ami= data.aws_ami.example.id
  instance_type="t3.small"
  vpc_security_group_ids=[data.aws_security_group.sg.id]
  tags={
    Name="test"
  }
}

data "aws_ami" "example" {
  executable_users = ["self"]
  most_recent = true
  name_regex  = "RHEL-9-DevOps-Practice"
  owners = ["973714476881"]

}



data "aws_security_group" "sg" {
  name="allow-all"
}
