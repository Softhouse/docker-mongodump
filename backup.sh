#!/bin/bash

set -e

source /tmp/mongodump_env

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/backup/backup-$DATE.tar.gz"

mongodump --quiet -h ${MONGO_PORT_27017_TCP_ADDR} -p ${MONGO_PORT_27017_TCP_PORT:-27017}
mkdir -p dump/
tar -zcvf $FILE dump/
rm -rf dump/
