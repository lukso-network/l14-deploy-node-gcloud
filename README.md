# Script to deploy a L14 node on Google Cloud Compute

## Deployment

```bash
$ gcloud config set project lukso-poc
$ gcloud config set compute/zone europe-west3-c

$ gcloud compute disks create disk123 \
    --size=200GB \
    --type=pd-standard \
    --replica-zones=europe-west3-b,europe-west3-c

$ gcloud compute instances create my-l14-node \
    --metadata-from-file startup-script=startup-script.sh \
    --disk=mode=rw,name=disk123
```

To check if the startup-script worked, ssh into the server and run:
```
$ cat /var/log/daemon.log
```

And look for `startup-script`.

[Find here the full config of parities config.toml](https://wiki.parity.io/Configuring-Parity-Ethereum)


## Usage

SSH to the node:

Read logs:
```bash
$ tail -f /var/log/parity.log
```

Start node:
```bash
$ sudo systemctl start parity
```

Stop node:
```bash
$ sudo systemctl stop parity
```

To edit the config
```bash
$ sudo nano /etc/parity/config.toml
```