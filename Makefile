.DEFAULT_GOAL := ping

## Ansible Drupal Installation/Configuration

# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

### Maintenance

ping:
	ansible drupal --module-name ansible.builtin.ping --args="data=pong"

reboot:
	ansible drupal --module-name ansible.builtin.reboot --args="reboot_timeout=300"

### Preflight

site-list:
	./scripts/gen-site-list.sh | tee site-list.json

export: export-site
export-site:
	ansible-playbook drupal/tasks/export-site.yml

deps:
	ansible-galaxy install --role-file requirements.yml --force

### Provisioning

dp7:
	ansible-playbook drupal/drupal_7.yml

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
