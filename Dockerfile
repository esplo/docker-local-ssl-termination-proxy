FROM alpine:3.6

LABEL maintainer="esplo <esplo@users.noreply.github.com>"

ENV NGINX_VERSION 1.13.5

RUN apk add --no-cache openssl nginx gettext \
    && mkdir -p /etc/nginx/ssl/ \
    && openssl req -new -x509 -sha256 -newkey rsa:2048 -days 365 -nodes -out /etc/nginx/ssl/nginx.pem -keyout /etc/nginx/ssl/nginx.key -subj "/C=JP/ST=MyState/L=MyLocality/O=MyOrg/OU=dev/CN=localhost" \
    && mkdir -p /run/nginx/

COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY entrypoint.sh .

EXPOSE 443
STOPSIGNAL SIGTERM

ENTRYPOINT sh entrypoint.sh
