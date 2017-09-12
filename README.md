# Infrastructure Repository

## Packer

### Use Packer to create pre-baked images.

Validate packer template ubuntu16.json

```sh
packer validate -var 'project_id=example-project' -var 'source_image=ubuntu-1604-xenial-v20170815a' ubuntu16.json
```

Discover what variables the template accepts. 
```sh
packer inspect ubuntu16.json
```

Build image

```sh
packer build -var 'project_id=example-project' -var 'source_image=ubuntu-1604-xenial-v20170815a' -var 'tags=webserver, puma' ubuntu16.json
```

## Scripts

Run deploy.sh script to deploy application.

Run startup_script.sh to make provisioning server and deploy application.

Create VM instance with startup script:

```sh
gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata-from-file startup-script=startup_script.sh reddit-app
```