# Infrastructure Repository

Run appropriate scripts to provision and deploy application:

+ install_ruby.sh
+ install_mongodb.sh
+ deploy.sh

Or run just one startup script:
```
./startup.script.sh
```

Create VM instance with startup script:
```
gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata-from-file startup-script=startup_script.sh reddit-app
```