#!/bin/bash

mkdir -p "${HOME}/workspace"

exec code-server \
    --disable-telemetry \
    --host=0.0.0.0 \
    "${HOME}/workspace"
