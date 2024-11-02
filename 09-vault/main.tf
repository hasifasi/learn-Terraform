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

# Vault Provider Configuration:
# Connects to Vault at the specified address.
# Uses a token (var.vault_token) for authentication.
# Sets skip_tls_verify = true, which allows Vault connections without validating SSL certificates (useful for testing but not recommended in production).
#
# Vault Token Variable:
# Declares a variable vault_token, which you can provide when running terraform apply to pass the Vault token securely.
#
# Vault Secret Retrieval:
# Retrieves the secret at path = "test/my_credentials" and makes its data available as data.vault_generic_secret.example_creds.
#
# Template File with Vault Data:
# The template_file block reads the example.tmpl file and replaces username and password placeholders with values from the Vault secret.
#
# Console Output:
# The output "rendered_template" block displays the rendered template with populated values on the console.