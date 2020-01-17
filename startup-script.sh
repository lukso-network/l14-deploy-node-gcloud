#! /bin/bash

if [ command -v parity ]
  then
    sudo apt update
    yes | sudo apt-get install git
    yes | sudo apt install snapd
    sudo snap install parity

    # mount disk
    sudo mkfs.ext4 -m 0 -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb
    sudo mkdir -p /mnt/disks/disk1
    sudo mount -o discard,defaults /dev/sdb /mnt/disk1
    sudo mkdir /mnt/disk1/data

    # parity system service
    sudo cp ./parity.service /etc/systemd/system
    sudo chmod +x /etc/systemd/system/parity.service
fi

sudo systemctl enable parity
