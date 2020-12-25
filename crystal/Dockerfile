ARG VERSION

FROM kodelib/code-server:${VERSION}

# hadolint ignore=DL3018
RUN apk add --no-cache crystal shards
RUN code-server --install-extension faustinoaq.crystal-lang