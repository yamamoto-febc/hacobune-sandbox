FROM ubuntu
MAINTAINER Kazumichi Yamamoto <yamamoto-febc@gmail.com>

# tools
RUN apt-get update; \
    apt-get install -y \
      ca-certificates curl net-tools iproute2 iputils-ping traceroute apt-transport-https gnupg2 lsb-release vim;

# gotty
RUN curl -LO https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz; \
    tar zxvf gotty_linux_amd64.tar.gz; \
    mv gotty /usr/local/bin; \
    rm gotty_linux_amd64.tar.gz

# kubectl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -; \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list; \
    apt-get update; \
    apt-get install -y kubectl

# docker-ce-cli
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg; \
    echo \
      "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null; \
    apt-get update; \
    apt-get install -y docker-ce-cli; \
    apt-get clean

ENV TERM=xterm

ENTRYPOINT ["/usr/local/bin/gotty"]
