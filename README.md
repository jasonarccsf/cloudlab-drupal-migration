# Cloudlab - Drupal Migration

An experiment to provision a Drupal lightsail server (basically a simplified EC2 instance), export a pantheon site, and import the site into the database.

## Prerequisites

Install homebrew


```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install dependencies

```sh
brew install ansible
brew install awscli
brew install aws-sso-util
brew install git
brew install jq
brew install pantheon-systems/external/terminus
brew install terraform
```

Install ansible role dependencies

```sh
make deps
```

## Setup

Configure terminus.

Configure terraform cloud.

```sh
make init
```

## Provision EC2 Instance

Generate AWS Credentials

```sh
aws-sso-util configure populate \
  --region us-west-1 \
  --sso-start-url https://ccsf.awsapps.com/start/
```

See: https://ccsfdt.atlassian.net/wiki/spaces/sfcloud/pages/1782972417/AWS+SSO+IAM+Identity+Center+Improved+Login+Flow

Run Terraform Apply

```sh
make apply
```

Get IPs

```sh
make output
```

## Configure Drupal 7 Instance

Run Ansible Playbook

```sh
make dp7
```
