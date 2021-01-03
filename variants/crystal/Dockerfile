ARG VERSION

FROM kodelib/code-server:${VERSION}

USER root

# hadolint ignore=DL3018
RUN apk add --no-cache crystal shards

USER developer