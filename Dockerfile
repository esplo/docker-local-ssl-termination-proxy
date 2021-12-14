FROM alpine:3.15

LABEL maintainer="esplo <esplo@users.noreply.github.com>"

ENV NGINX_VERSION 1.20.2

RUN apk update \
    && apk upgrade \
    && apk add --no-cache openssl nginx gettext \
    && mkdir -p /etc/nginx/ssl/ \
    && mkdir -p /run/nginx/

RUN openssl req -new \
    -x509 \
    -sha256 \
    -newkey rsa:2048 \
    -days 365 \
    -nodes \
    -out /etc/nginx/ssl/nginx.pem \
    -keyout /etc/nginx/ssl/nginx.key \
    -subj "/C=JP/ST=MyState/L=MyLocality/O=MyOrg/OU=dev/CN=localhost" \
    -addext "subjectAltName = DNS:8.8.8.8,IP:127.0.0.1,IP:192.168.1.1" \
    -addext "extendedKeyUsage = serverAuth"

COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY entrypoint.sh .

EXPOSE 443

STOPSIGNAL SIGQUIT

ENTRYPOINT sh entrypoint.sh
