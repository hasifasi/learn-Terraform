provider "vault" {
  address = "https://172.31.39.97:8200"
  token=var.vault_token
  skip_tls_verify = true
}

variable "vault_token" {}


data "vault_generic_secret" "example_creds" {
  path = "test/my_credentials"
}

data "template_file" "example_template" {
  template = file("./example.tmpl")
  vars = {
    username = data.vault_generic_secret.example_creds.data["username"]
    password = data.vault_generic_secret.example_creds.data["password"]
  }
}

output "rendered_template" {
  value = data.template_file.example_template.rendered
  description = "The rendered template with Vault credentials"
}