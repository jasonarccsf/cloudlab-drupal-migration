# Cloudlab - Drupal Migration

An experiment to provision a Drupal lightsail server (basically a simplified EC2 instance), export a pantheon site, and import the site into the database.

## Prerequisites

```
brew install terraform
brew install pantheon-systems/external/terminus
```

## Provision EC2 Instance

```
make apply
```

## Configure Drupal

```
make dp
```
