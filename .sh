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

CMD1="ssh-keyscan  $INSTANCE >> ~/.ssh/known_hosts"
CMD2="sudo rsync -r -a -v -e 'ssh -i $KEY_AWS_MM' ubuntu@$INSTANCE:$UPLOADS_DIR $UPLOADS_DIR"
CMD3="ssh-keygen -R $INSTANCE"

sudo runuser -l root -c "${CMD1}; ${CMD2}; ${CMD3};" 
