#!/usr/bin/env bash

# latest consul Ent release
CONSUL_VERSION=$(curl -sL https://releases.hashicorp.com/consul/index.json | jq -r '.versions[].version' | sort -V | egrep -v 'beta|rc|alpha' | tail -n1)

# latest consul OSS release
# CONSUL_VERSION=$(curl -sL https://releases.hashicorp.com/consul/index.json | jq -r '.versions[].version' | sort -V | egrep -v 'ent|beta|rc|alpha' | tail -n1)

# custom consul release
# CONSUL_VERSION="1.9.5+ent"

wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip

sudo unzip consul_${CONSUL_VERSION}_linux_amd64.zip

sudo chown root:root consul
sudo mv consul /usr/local/bin/

consul -autocomplete-install
complete -C /usr/local/bin/consul consul
sudo useradd --system --home /etc/consul.d --shell /bin/false consul
sudo mkdir --parents /opt/consul
sudo chown --recursive consul:consul /opt/consul

sudo rm -f consul_${CONSUL_VERSION}_linux_amd64.zip
