#!/bin/bash

sed -i 's|MONGO_URL|'"$MONGO_URL"'|' mongosqld-config.yml
sed -i 's|SCHEMA_DB|'"$SCHEMA_DB"'|' mongosqld-config.yml
rm -f /var/run/rsyslogd.pid && rsyslogd -n
sudo -S service rsyslog start
mongosqld --config=/home/mongobi/mongodb-bi-linux-x86_64-ubuntu1804-v2.14.5/mongosqld-config.yml \
  --logPath=/home/mongobi/mongodb-bi-linux-x86_64-ubuntu1804-v2.14.5/log/sqld.log
