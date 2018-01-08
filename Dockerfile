FROM oznu/s6-node:8.9.4

RUN apk add --no-cache git python make g++ libffi-dev openssl-dev avahi-compat-libdns_sd avahi-dev openrc dbus \
  && yarn global add node-gyp \
  && mkdir /homebridge \
  && mkdir -p /home/root/homebridge \
  && npm install -g npm@4.6.1

ENV HOMEBRIDGE_VERSION 0.4.35
RUN yarn global add homebridge@$HOMEBRIDGE_VERSION

WORKDIR /homebridge
VOLUME /homebridge

ENV S6_KEEP_ENV=1

COPY root /
