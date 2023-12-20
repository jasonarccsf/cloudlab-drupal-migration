.DEFAULT_GOAL := ping

## Ansible Drupal Installation/Configuration

# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

### Dependencies

deps:
	ansible-galaxy install --role-file requirements.yml --force

### Provisioning

setup:
	ansible-playbook drupal/drupal-setup.yml

install:
	ansible-playbook drupal/drupal-install.yml

export:
	ansible-playbook drupal/drupal-export-pantheon-site.yml

import: i1 i2 i3

i1: import-db
import-db:
	ansible-playbook drupal/drupal-import-db.yml

i2: import-source
import-source:
	ansible-playbook drupal/drupal-import-source.yml

i3: import-files
import-files:
	ansible-playbook drupal/drupal-import-files.yml

### Maintenance

ping:
	ansible drupal --module-name ansible.builtin.ping --args="data=pong" -vv

ec2-ping:
	ansible all --inventory inventory.aws_ec2.yml --module-name ansible.builtin.ping --args="data=pong" -vv

reboot:
	ansible drupal --module-name ansible.builtin.reboot --args="reboot_timeout=300"

## Debug

debug-vars:
	ansible-playbook drupal/debug-vars.yml

ec2-debug-vars:
	ansible-playbook --inventory inventory.aws_ec2.yml drupal/debug-vars.yml

ec2-inventory:
	ansible-inventory --inventory inventory.aws_ec2.yml --graph

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
