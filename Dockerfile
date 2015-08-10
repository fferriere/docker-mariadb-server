FROM fferriere/mariadb-base

MAINTAINER ferriere.florian@gmail.com

RUN apt-get update && apt-get install -y mariadb-server

# change local listen to all address listen
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD files/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN mkdir -p /var/run/mysqld && \
    chown mysql /var/run/mysqld

EXPOSE 3306

VOLUME  [ "/var/lib/mysql", "/var/log/mysql", "/var/run/mysqld" ]

CMD [ "/usr/local/bin/entrypoint.sh" ]
