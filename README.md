# Simple repo to deploy a node on Google Cloud Compute

## Deployment

```bash
$ gcloud compute instances create my-l14-node \
      --metadata-from-file startup-script=start-script.sh
```


## Handling

SSH to the node:

Read logs:
```bash
tail -f /var/log/parity.log
```

Start node:
```bash
sudo systemctl start parity
```

Stop node:
```bash
sudo systemctl stop parity
```