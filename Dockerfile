FROM alpine:3.12

ARG VERSION

# hadolint ignore=DL3018
RUN apk add --no-cache curl nodejs npm sudo alpine-sdk bash openssh-client \
    libstdc++ libc6-compat libx11-dev libxkbfile-dev libsecret-dev

# hadolint ignore=SC2086
RUN npm install -g yarn@1.22.10 \
    && yarn global add code-server@${VERSION} \
    && yarn cache clean

COPY /scripts/entrypoint.sh /entrypoint.sh

RUN curl -sL https://github.com/marghidanu/werk/releases/download/0.2.0/werk-ubuntu-18.04 -o /usr/local/bin/werk \
    && chmod a+x /usr/local/bin/werk

RUN adduser -D kodelib --shell /bin/bash \
    && echo "kodelib ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd

USER kodelib

ENTRYPOINT ["/entrypoint.sh"]

HEALTHCHECK \
    CMD curl --fail http://localhost:8080/healthz || exit 1