#!/bin/bash
set -e

[[ $DEBUG == true ]] && set -x

HOST=${HOST:-"0.0.0.0"}
PORT=${PORT:-"3000"}
CONFIG=${CONFIG:-"/data/config.yaml"}
TABLE_PREFIX=${TABLE_PREFIX:-"test"}

if [ "$1" = 'SERVICE' ]; then
    exec SERVICE --host $HOST --port $PORT --config $CONFIG --table_prefix $TABLE_PREFIX
else
    exec $@
fi
