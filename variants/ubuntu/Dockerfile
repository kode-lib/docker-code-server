FROM ubuntu:20.04

ARG VERSION
ARG ARCH=amd64

# hadolint ignore=DL3008,DL3015
RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y curl sudo zsh git \
    && apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN curl -L "$(curl -sL https://api.kodelib.com/v1/apps/werk/latest/url)" -o /usr/local/bin/werk \
    && chmod a+x /usr/local/bin/werk

RUN curl -sfL https://github.com/cdr/code-server/releases/download/v${VERSION}/code-server_${VERSION}_${ARCH}.deb -o code-server.deb \
    && dpkg -i code-server.deb \
    && useradd kodelib -m -d /home/kodelib -s /bin/bash \
    && echo "kodelib ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd

COPY /scripts/entrypoint.sh /entrypoint.sh

USER kodelib

HEALTHCHECK --interval=5s --timeout=10s --retries=10 \
    CMD curl --fail http://localhost:8080/healthz || exit 1

ENTRYPOINT ["/entrypoint.sh"]