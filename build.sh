#!/bin/bash

THIS_PATH=$(dirname $(realpath $0))

NAME='fferriere/mariadb-server'
if [ -n "$FFERRIERE_MARIADB_SERVER_IMAGE" ]; then
    NAME="$FFERRIERE_MARIADB_SERVER_IMAGE"
fi

docker build -t $NAME $@ $THIS_PATH/.
