#!/bin/bash

echo "Checking parity installation..."

FILE=/snap/bin/parity
if ! test -f "$FILE"; then

    echo "Installing parity..."

    sudo apt update
    yes | sudo apt-get install git
    yes | sudo apt install snapd
    sudo snap install parity

    # mount disk
    sudo mkfs.ext4 -m 0 -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb
    sudo mkdir -p /mnt/disk1
    sudo mount -o discard,defaults /dev/sdb /mnt/disk1
    sudo mkdir /mnt/disk1/data

    git clone https://github.com/lukso-network/l14-deploy-node-gcloud.git
    cd l14-deploy-node-gcloud

    # move config files
    sudo mkdir /etc/parity/
    sudo cp ./config.toml /etc/parity/
    sudo cp ./spec.json /etc/parity/
    sudo rm ./config.toml
    sudo rm ./spec.json

    # parity system service
    sudo cp ./parity.service /etc/systemd/system
    sudo chmod +x /etc/systemd/system/parity.service
fi

echo "Starting parity..."

sudo systemctl enable parity

sudo systemctl start parity
