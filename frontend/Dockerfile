FROM node:14-bullseye AS builder

RUN useradd -m -d /frontend frontend
USER frontend
RUN git clone https://github.com/bezkoder/react-crud-web-api /frontend/app

WORKDIR /frontend/app

RUN npm install

COPY http-common.js /frontend/app/src/http-common.js
RUN npm run-script build
COPY default.conf.template /frontend/app/default.conf.template

FROM nginx
ENV NGINX_ENVSUBST_TEMPLATE_DIR /frontend/app
WORKDIR /usr/share/nginx/html
COPY --from=builder /frontend/app /frontend/app
RUN apt-get update -y
RUN apt-get install certbot python3-certbot-nginx -y