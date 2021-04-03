FROM alpine:3.12

ARG VERSION

RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

# hadolint ignore=DL3018
RUN apk add --no-cache curl nodejs npm sudo alpine-sdk bash openssh-client libstdc++ libc6-compat libx11-dev libxkbfile-dev libsecret-dev \
    && adduser -D kodelib --shell /bin/bash \
    && echo "kodelib ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd

RUN curl -L $(curl -sL https://api.kodelib.com/v1/apps/werk/latest/url) -o /usr/local/bin/werk \
    && chmod a+x /usr/local/bin/werk

RUN npm install -g yarn@1.22.10 \
    && yarn global add code-server@${VERSION} \
    && yarn cache clean

COPY /scripts/entrypoint.sh /entrypoint.sh

USER kodelib

HEALTHCHECK --interval=5s --timeout=10s --retries=10 \
    CMD curl --fail http://localhost:8080/healthz || exit 1

ENTRYPOINT ["/entrypoint.sh"]