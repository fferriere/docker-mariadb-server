#!/bin/bash

NAME='fferriere-mariadb-server'
if [ -n "$FFERRIERE_MARIADB_SERVER_NAME" ]; then
    NAME="$FFERRIERE_MARIADB_SERVER_NAME"
fi

DATA_NAME='fferriere-mariadb-data'
if [ -n "$FFERRIERE_MARIADB_DATA_NAME" ]; then
    DATA_NAME="$FFERRIERE_MARIADB_DATA_NAME"
fi

IMAGE='fferriere/mariadb-server'
if [ -n "$FFERRIERE_MARIADB_SERVER_IMAGE" ]; then
    IMAGE="$FFERRIERE_MARIADB_SERVER_IMAGE"
fi

NB_ROWS=$(docker ps | grep -w "$NAME" | wc -l)
if [ "$NB_ROWS" -gt 0 ]; then
    echo 'already started' >&2
    exit 1
fi

NB_ROWS=$(docker ps -a | grep -w "$DATA_NAME" | wc -l)
if [ "$NB_ROWS" -eq 0 ]; then
    echo "Container '$DATA_NAME' doesn't exists !" >&2
    exit 2
fi

NB_ROWS=$(docker ps -a | grep -w "$NAME" | wc -l)
if [ "$NB_ROWS" -gt 0 ]; then
    docker rm "$NAME"
fi

RUN_ARGS='-d'
if [ $(echo "$@" | grep "bash" | wc -l) -gt 0 ]; then
    RUN_ARGS='--rm -ti'
fi

docker run $RUN_ARGS \
  --name $NAME \
  --volumes-from $DATA_NAME \
  $IMAGE $@
