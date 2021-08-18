FROM ubuntu
MAINTAINER Kazumichi Yamamoto <yamamoto-febc@gmail.com>

RUN apt-get update; apt-get install -y ca-certificates curl; apt-get clean
RUN curl -LO https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz 
RUN tar zxvf gotty_linux_amd64.tar.gz; mv gotty /usr/local/bin
RUN rm gotty_linux_amd64.tar.gz

RUN apt-get update && apt-get install -y apt-transport-https gnupg2
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl

RUN apt-get install -y net-tools iputils-ping

ENTRYPOINT ["/usr/local/bin/gotty"]
