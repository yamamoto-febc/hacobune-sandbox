FROM ubuntu
MAINTAINER Kazumichi Yamamoto <yamamoto-febc@gmail.com>

RUN apt-get update; apt-get install -y ca-certificates curl; apt-get clean
RUN curl -LO https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz 
RUN tar zxvf gotty_linux_amd64.tar.gz; mv gotty /usr/local/bin
RUN rm gotty_linux_amd64.tar.gz

ENTRYPOINT ["/usr/local/bin/gotty"]
