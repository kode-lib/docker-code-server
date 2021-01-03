#!/bin/bash

mkdir -p "${HOME}/workspace"

export SHELL=/bin/bash
export PS1="\w $ "
exec code-server \
    --disable-telemetry \
    --host=0.0.0.0 \
    "${HOME}/workspace"
