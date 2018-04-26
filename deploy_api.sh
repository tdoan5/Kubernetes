gcloud compute firewall-rules create rule-allow-tcp-6000 --source-ranges 0.0.0.0/0 --target-tags http-server --allow tcp:6000

gcloud compute instances create test-inst --machine-type n1-standard-1 --image-family debian-8 --image-project debian-cloud --tags http-server --metadata-from-file startup-script=./startup.sh
