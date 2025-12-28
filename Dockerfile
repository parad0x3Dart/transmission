FROM docker.io/busybox:stable as twc_downloader
WORKDIR /data
RUN wget -qO - https://github.com/ronggang/transmission-web-control/archive/refs/heads/master.tar.gz \
    | tar -x -z -f - --strip-components=1 -C /data

FROM ghcr.io/linuxserver/transmission:4.0.5
WORKDIR /webroot
COPY --from=twc_downloader /data/src /webroot/transmission-web-control
ENV TRANSMISSION_WEB_HOME=/webroot/transmission-web-control
LABEL maintainer="parad0x3Dart" \
    org.opencontainers.image.title="ghcr.io/parad0x3dart/transmission" \
    org.opencontainers.image.url="https://github.com/parad0x3Dart/transmission" \
    org.opencontainers.image.source="https://github.com/parad0x3Dart/transmission" \
    org.opencontainers.image.licenses="MIT"
