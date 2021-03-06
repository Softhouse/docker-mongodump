#!/bin/bash

set -e

env | grep -E "PATH|MONGO" > /tmp/mongodump_env

CRON_SCHEDULE=${CRON_SCHEDULE:-* * * * *}

if [[ "$1" == 'no-cron' ]]; then
    exec /backup.sh
else
    cp /crontab /etc/cron.d/mongobackup-cron
    exec cron -f
fi
