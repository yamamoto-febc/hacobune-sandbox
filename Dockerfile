FROM ubuntu
MAINTAINER Kazumichi Yamamoto <yamamoto-febc@gmail.com>

RUN apt-get update; \
    apt-get install -y ca-certificates curl zip; \
    apt-get clean; \
    curl -LO https://github.com/kazeburo/wsgate-client/releases/download/v0.4.0/wsgate-client_linux_amd64.zip; \
    unzip -j wsgate-client_linux_amd64.zip wsgate-client; \
    rm wsgate-client_linux_amd64.zip; \
    mv wsgate-client /usr/local/bin/


ENTRYPOINT ["/usr/local/bin/wsgate-client"]
