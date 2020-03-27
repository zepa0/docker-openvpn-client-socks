FROM alpine:latest

LABEL maintainer="melsonlai"

RUN wget -O- -q https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-amd64.tar.gz | tar xzf - -C /

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
      apk update && \
      apk add dante-server openvpn openresolv

COPY sockd.conf /etc/sockd.conf
COPY services.d /etc/services.d
RUN chmod 511 /etc/services.d/sockd/run

ENTRYPOINT [ "/init" ]
CMD [ "/bin/sh", "-c", "cd /root/openvpn/ && exec /usr/sbin/openvpn --config *.ovpn --script-security 2 --up /etc/openvpn/up.sh --down /etc/openvpn/down.sh" ]
