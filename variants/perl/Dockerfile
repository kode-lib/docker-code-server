ARG VERSION

FROM kodelib/code-server:${VERSION}

USER root

# hadolint ignore=DL3018,DL4006
RUN apk add --no-cache wget perl perl-dev \
    && curl -sL https://cpanmin.us | perl - --curl App::cpanminus \
    && cpanm -nq local::lib

USER developer