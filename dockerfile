FROM alpine:latest

ADD https://github.com/rancher/k3s/releases/download/v1.17.2+k3s1/k3s /usr/bin/k3s

COPY config.toml /tmp/config.toml

COPY setup.sh /etc/setup.sh

RUN  apk --no-cache add bash && \
    mkdir -p mkdir var/lib/rancher/k3s/agent/etc/containerd/ && \
    chmod 755 /usr/bin/k3s && \
    chmod 755 /tmp/config.toml && \
    chmod 755 /etc/setup.sh

CMD /etc/setup.sh
