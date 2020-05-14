#!/usr/bin/env bash

source docreds.sh

export DO_PAT=BING
export DO_SSH_FINGERPRINT=BING
terraform destroy -var "do_token=${DO_PAT}" -var "pub_key=$HOME/.ssh/id_rsa.pub" -var "pvt_key=$HOME/.ssh/id_rsa" -var "ssh_fingerprint=${DO_SSH_FINGERPRINT}" -force
