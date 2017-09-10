#!/bin/sh

set -eu

CMDNAME=`basename $0`
if [ $# -ne 1 ]; then
  echo "Usage: $CMDNAME port" 1>&2
  exit 1
fi

export PORT=$1
export HOST_IP=`ipconfig getifaddr en0`

docker-compose up

