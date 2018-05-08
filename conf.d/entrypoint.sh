#!/bin/bash
set -e

[[ $DEBUG == true ]] && set -x

HOST=${HOST:-"0.0.0.0"}
PORT=${PORT:-"3000"}
CONFIG=${CONFIG:-"/data/config.yaml"}
TABLE_PREFIX=${TABLE_PREFIX:-"test"}

exec $1 --host $HOST --port $PORT --config $CONFIG --table_prefix $TABLE_PREFIX
