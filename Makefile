.DEFAULT_GOAL := ping

## Drupal

# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

### Maintenance

ping:
	ansible drupal --module-name ansible.builtin.ping --args="data=pong"

reboot:
	ansible drupal --module-name ansible.builtin.reboot --args="reboot_timeout=300"

### Provisioning

.PHONY: drupal
drupal:
	ansible-playbook drupal/main.yml

upgrade:
	ansible-playbook drupal/tasks/upgrade.yml

## Development

deps:
	ansible-galaxy install --role-file requirements.yml --force

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