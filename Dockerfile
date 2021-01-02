FROM alpine:3.12

ARG VERSION

# hadolint ignore=DL3018,SC2086
RUN apk add --no-cache curl nodejs npm alpine-sdk bash zsh libstdc++ libc6-compat libx11-dev libxkbfile-dev libsecret-dev \
    && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && npm install -g yarn@1.22.10 \
    && yarn global add code-server@${VERSION} \
    && yarn cache clean \
    && code-server --install-extension tyriar.sort-lines \
    && code-server --install-extension wmaurer.change-case \
    && code-server --install-extension adrientoub.base64utils

COPY /scripts/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

HEALTHCHECK \
    CMD curl --fail http://localhost:8080/healthz || exit 1