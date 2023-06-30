encrypt:
	ansible-vault encrypt --vault-password-file vault-password terraform/variables.tf
decrypt:
	ansible-vault decrypt --vault-password-file vault-password terraform/variables.tf