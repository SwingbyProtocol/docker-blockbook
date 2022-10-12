#!/bin/bash
if ! type "docker" >/dev/null; then
    apt-get update
    apt-get install -y docker.io git
    service docker start
fi
if ! type "docker-compose" >/dev/null; then
    apt-get update
    apt-get install -y curl
    sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi
if ! sh -c "service ntp status" > /dev/null; then
    apt-get update
    apt-get install -y ntp
    service ntp start
fi
# Make swap file
if ! grep -q '/swapfile swap swap defaults 0 0' "/etc/fstab"; then
    fallocate -l 10G /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
    echo '/swapfile swap swap defaults 0 0' >>/etc/fstab
fi
