# docker-mariadb-server

This project create a MariaDB server in docker container.
The container is based on [docker-mariadb-base](https://github.com/fferriere/docker-postgresl-base) image.
It use volume from [docker-mariadb-data](https://github.com/fferriere/docker-mariadb-data).

## Build

To build container run `build.sh` script. You can customize image's name with `FFERRIERE_MARIADB_SERVER_IMAGE` variable. Example :
```
$ FFERRIERE_MARIADB_SERVER_IMAGE="prefix/mariadb-server" ./build.sh
```

# Run

To run container execute `run.sh` script.

If you have customized build of [docker-mariadb-data](https://github.com/fferriere/docker-mariadb-data) you should give `FFERRIERE_MARIADB_DATA_NAME` variable.

You can customize container's name with `FFERRIERE_MARIADB_SERVER_NAME`. Example :
```
$ FFERRIERE_MARIADB_SERVER_IMAGE="prefix/mariadb-server" FFERRIERE_MARIADB_SERVER_NAME="prefx-mariadb-server" \
    FFERRIERE_MARIADB_DATA_NAME="prefix-mariadb-data" ./run.sh
```
