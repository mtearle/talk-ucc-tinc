#!/usr/bin/env bash
source docreds.sh

terraform init
terraform plan -var "do_token=${DO_PAT}" -var "pub_key=$HOME/.ssh/id_rsa.pub" -var "pvt_key=$HOME/.ssh/id_rsa" -var "ssh_fingerprint=${DO_SSH_FINGERPRINT}"
terraform apply -var "do_token=${DO_PAT}" -var "pub_key=$HOME/.ssh/id_rsa.pub" -var "pvt_key=$HOME/.ssh/id_rsa" -var "ssh_fingerprint=${DO_SSH_FINGERPRINT}" -auto-approve
terraform show 
terraform state pull
#terraform state pull | jq '.resources[] | .name + " " + .instances[0].attributes.ipv4_address'
(echo "[tincdemo]";terraform state pull | jq '.resources[] | .name + " " + .instances[0].attributes.ipv4_address' | sed 's/"//g' | sed 's/ / ansible_user=root ansible_host=/') > tincdemo.inventory
cat tincdemo.inventory
export ANSIBLE_HOST_KEY_CHECKING=false
ansible-playbook -i tincdemo.inventory uccdemo.yml
