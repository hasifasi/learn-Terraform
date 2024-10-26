variable "url"{
  default="wafer"
    }

# Access the Variable

output "URL" {
  value = var.url
}

output "URL1" {
  value = "The URL is  ${var.url}"
}

# Data types
variable "num1" {
  default = 10
}

variable "bool1" {
  default = true
}

variable "str1" {
  default = "Hello"
}

# Numbers, Booleans & Strings

# Variable types
variable "str2" {
  default = "World"
}

variable "list1" {
  default = [
    10,
    20,
    "xyz",
    false
  ]
}

# List can have combination of multiple data types also.

variable "map1" {
  default = {
    aws = {
      trainer = "John"
      duration = 30
    }
    devops = {
      trainer = "Steve"
      duration = 20
    }
  }
}


output "list1_1" {
  value = var.list1[2]
}

output "map1_aws_trainer" {
  value = var.map1["aws"]["trainer"]
  #value = var.map1["aws"].trainer
}