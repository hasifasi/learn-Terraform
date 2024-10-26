variable "fruit" {
  default={
    apple={}
    banana={}
    orange={}
  }
}

resource "null_resource" "rfruits" {
  for_each = var.fruit
}

