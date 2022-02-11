#!/bin/sh

APP_FOLDER="/${MYSQL_USER}/app"
sed -i -e "s/REPLACE_HOST/${MYSQL_HOST}/" ${APP_FOLDER}/app/config/db.config.js
sed -i -e "s/REPLACE_USER/${MYSQL_USER}/" ${APP_FOLDER}/app/config/db.config.js
sed -i -e "s/REPLACE_PASSWORD/${MYSQL_PASSWORD}/" ${APP_FOLDER}/app/config/db.config.js
sed -i -e "s/REPLACE_DB/${MYSQL_DATABASE}/" ${APP_FOLDER}/app/config/db.config.js

retries=1

while /bin/true; do
    mysql -u$MYSQL_USER -h$MYSQL_HOST -p$MYSQL_PASSWORD $MYSQL_DATABASE -e "SHOW DATABASES;" > /dev/null 2>&1
    [ $? -eq 0 ] && break
    echo "MySQL database is not up yet! Sleeping... Attempt: $retries"
    retries=$((retries+1))
    sleep 1
done

echo "-----"
echo "MySQL database up!"
echo "Running node ${APP_FOLDER}/server.js.."
echo "-----"

node ${APP_FOLDER}/server.js