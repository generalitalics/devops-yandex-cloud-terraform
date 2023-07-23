encrypt:
	ansible-vault encrypt --vault-password-file vault-password terraform/variables.tf
decrypt:
	ansible-vault decrypt --vault-password-file vault-password terraform/variables.tf
init:
	terraform -chdir=terraform/ init
plan:
	terraform -chdir=terraform/ plan
apply:
	terraform -chdir=terraform/ apply
destroy:
	terraform -chdir=terraform/ destroy
install:
	ansible-galaxy install -r ansible/requirements.yml
deploy:
	ansible-playbook ansible/playbook.yml -i ansible/inventory.ini --vault-password-file vault-password