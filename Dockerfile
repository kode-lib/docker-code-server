FROM alpine:3.12

RUN apk add --no-cache curl nodejs npm alpine-sdk bash libstdc++ libc6-compat libx11-dev libxkbfile-dev libsecret-dev \
    && npm install -g yarn \
    && yarn global add code-server@3.8.0

ENV SHELL /bin/bash

WORKDIR /opt/workspace

HEALTHCHECK CMD curl --fail http://localhost:8080/healthz || exit 1

ENTRYPOINT [ "code-server", "--host=0.0.0.0" ]
CMD [ "/opt/workspace"]