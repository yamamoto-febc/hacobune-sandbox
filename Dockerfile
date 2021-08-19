FROM ubuntu
MAINTAINER Kazumichi Yamamoto <yamamoto-febc@gmail.com>

RUN apt-get update; \
    apt-get install -y ca-certificates curl zip; \
    apt-get clean; \
    curl -LO https://github.com/kazeburo/wsgate-server/releases/download/v0.4.0/wsgate-server_linux_amd64.zip; \
    unzip -j wsgate-server_linux_amd64.zip wsgate-server; \
    rm wsgate-server_linux_amd64.zip; \
    mv wsgate-server /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/wsgate-server"]