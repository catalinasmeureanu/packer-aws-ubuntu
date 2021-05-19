#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
export APTARGS="-qq -o=Dpkg::Use-Pty=0"

sudo apt-get clean ${APTARGS}
sudo apt-get update ${APTARGS}

sudo apt-get upgrade -y ${APTARGS}
sudo apt-get dist-upgrade -y ${APTARGS}

# Update to the latest kernel
sudo apt-get install -y linux-generic linux-image-generic ${APTARGS}

# pip
sudo apt-get install -y python-pip ${APTARGS}
sudo apt-get install -y python3-pip ${APTARGS}

# git
sudo apt-get install -y git ${APTARGS}

# jq
sudo apt-get install -y jq ${APTARGS}

# curl
sudo apt-get install -y curl ${APTARGS}

# wget
sudo apt-get install -y wget ${APTARGS}

# vim
sudo apt-get install -y vim ${APTARGS}

# unzip
sudo apt-get install -y unzip ${APTARGS}

# network utilities
sudo apt-get install -y net-tools ${APTARGS}

# process viewer
sudo apt-get install -y htop ${APTARGS}

# dnsutils
sudo apt-get install -y dnsutils ${APTARGS}
