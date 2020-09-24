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
KEY_AWS_MM="/home/ubuntu/.ssh/mm-tuc-dt-8200-xp-key.pem"
UPLOADS_DIR="/var/www/$DOMAIN/public/content/uploads/"

_KEYSCAN="ssh-keyscan  $INSTANCE >> ~/.ssh/known_hosts"
_RSYNCUP="rsync -r -a -v -e 'ssh -i $KEY_AWS_MM' ubuntu@$INSTANCE:$UPLOADS_DIR $UPLOADS_DIR"
_RSYNCDN="rsync -r -a -v -e 'ssh -i $KEY_AWS_MM' $UPLOADS_DIR ubuntu@$INSTANCE:$UPLOADS_DIR"
_KEYGEN="ssh-keygen -R $INSTANCE"

sudo runuser -l root -c "${_KEYSCAN}; ${_RSYNCUP}; ${_RSYNCDN}; ${_KEYGEN};" 
