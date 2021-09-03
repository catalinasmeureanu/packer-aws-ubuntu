#!/usr/bin/env bash

# latest Vault Ent release
VAULT_VERSION=$(curl -sL https://releases.hashicorp.com/vault/index.json | jq -r '.versions[].version' | sort -V | egrep -v 'beta|rc|alpha' | tail -n1)


wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip

sudo unzip vault_${VAULT_VERSION}_linux_amd64.zip

sudo chown root:root vault
sudo mv vault /usr/local/bin/

sudo rm -f vault_${VAULT_VERSION}_linux_amd64.zip
