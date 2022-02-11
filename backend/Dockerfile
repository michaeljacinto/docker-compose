FROM node:14-bullseye AS builder

USER root
RUN apt-get update -y && apt-get install -y default-mysql-client

ARG MYSQL_USER
RUN useradd -m -d /backend backend
USER backend
RUN git clone https://github.com/bezkoder/nodejs-express-sequelize-mysql /backend/app

WORKDIR /backend/app

RUN npm install

EXPOSE 8080

COPY start.sh /start.sh
COPY db.config.js /backend/app/app/config/db.config.js

CMD [ "/bin/bash", "/start.sh" ]