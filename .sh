#!/bin/bash

while getopts d:i: option
do
  case "${option}"
    in
    d) DOMAIN=${OPTARG};;
    i) INSTANCE=${OPTARG};;
  esac
done

# KEYS & PATHS
KEY_AWS_MM="~/.ssh/mm-tuc-dt-8200-xp-key.pem"
UPLOADS_DIR="/var/www/$DOMAIN/public/content/uploads/"

sudo runuser -l root -c "sudo rsync -r -a -v -e 'ssh -i $KEY_AWS_MM' ubuntu@$INSTANCE:$UPLOADS_DIR $UPLOADS_DIR"
