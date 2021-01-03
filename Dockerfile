FROM alpine:3.12

ARG VERSION

# hadolint ignore=DL3018
RUN apk add --no-cache curl nodejs npm sudo alpine-sdk bash \
    libstdc++ libc6-compat libx11-dev libxkbfile-dev libsecret-dev

# hadolint ignore=SC2086
RUN npm install -g yarn@1.22.10 \
    && yarn global add code-server@${VERSION} \
    && yarn cache clean

COPY /scripts/entrypoint.sh /entrypoint.sh

RUN adduser -D developer --shell /bin/bash \
    && echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd

USER developer

ENTRYPOINT ["/entrypoint.sh"]

HEALTHCHECK \
    CMD curl --fail http://localhost:8080/healthz || exit 1