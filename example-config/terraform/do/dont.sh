#!/usr/bin/env bash

source docreds.sh

terraform destroy -var "do_token=${DO_PAT}" -var "pub_key=$HOME/.ssh/id_rsa.pub" -var "pvt_key=$HOME/.ssh/id_rsa" -var "ssh_fingerprint=${DO_SSH_FINGERPRINT}" -force
