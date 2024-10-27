default:
	rm -rf .terraform
	terraform init
	terraform $(action) -auto-approve -var-file=$(env)/provideenv.tfvars