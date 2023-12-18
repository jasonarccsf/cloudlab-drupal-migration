.DEFAULT_GOAL := ping

## Ansible Drupal Installation/Configuration

# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

### Dependencies

deps:
	ansible-galaxy install --role-file requirements.yml --force

### Provisioning

d7:
	ansible-playbook drupal/drupal7.yml

e: d7-export
d7-export:
	ansible-playbook drupal/drupal7-export-pantheon-site.yml

i: d7-import-db
d7-import-db:
	ansible-playbook drupal/drupal7-import-db.yml

### Maintenance

ping:
	ansible drupal --module-name ansible.builtin.ping --args="data=pong"

reboot:
	ansible drupal --module-name ansible.builtin.reboot --args="reboot_timeout=300"

## Pantheon Scripts

site-list:
	./scripts/gen-site-list.sh | tee site-list.json

# export:
# 	./scripts/pantheon-export-site.sh

## Terraform Infrastructure

TF_DIR = infrastructure/

init:
	terraform -chdir=$(TF_DIR) init -upgrade

plan: init
	terraform -chdir=$(TF_DIR) plan -input=false

apply: init
	terraform -chdir=$(TF_DIR) apply

fmt:
	terraform -chdir=$(TF_DIR) fmt -recursive

validate: init
	terraform -chdir=$(TF_DIR) validate

output: init
	terraform -chdir=$(TF_DIR) output -json

version:
	terraform -chdir=$(TF_DIR) version
