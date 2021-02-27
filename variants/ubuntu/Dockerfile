FROM ubuntu:20.04

ARG VERSION

# hadolint ignore=DL3008,DL3015
RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y curl sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN curl -sfOL https://github.com/cdr/code-server/releases/download/v${VERSION}/code-server_${VERSION}_amd64.deb \
    && dpkg -i code-server_${VERSION}_amd64.deb \
    && useradd kodelib -m -d /home/kodelib -s /bin/bash \
    && echo "kodelib ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd

COPY /scripts/entrypoint.sh /entrypoint.sh

USER kodelib

HEALTHCHECK --interval=5s --timeout=10s --retries=10 \
    CMD curl --fail http://localhost:8080/healthz || exit 1

ENTRYPOINT ["/entrypoint.sh"]