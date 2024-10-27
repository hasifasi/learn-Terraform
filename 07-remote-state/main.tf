terraform {
  backend "s3" {
    bucket = "LeanStatefile_wafer"
    key    = "sample/terraform.tfstate"
    region = "us-east-1"
  }
}


resource "null_resource" "test" {}


# This is to store the meta data of terraform config in s3 bucket.. in case if my machine is corrupted, i can use use this state file in someother
# machine and continue with infra structure.