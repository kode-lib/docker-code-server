#!/bin/bash

set -e

BASE_DIR=${1:-/data}

echo "[*] Creating additional directories"
mkdir -p "${BASE_DIR}/settings"
mkdir -p "${BASE_DIR}/workspace"

echo "[*] Starting code-server"

export SHELL=/bin/zsh
exec code-server \
    --disable-telemetry \
    --host=0.0.0.0 \
    --user-data-dir="${BASE_DIR}/settings" \
    "${BASE_DIR}/workspace"
