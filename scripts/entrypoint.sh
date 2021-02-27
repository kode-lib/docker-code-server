#!/bin/bash

mkdir -p "${HOME}/workspace"

export SHELL=/bin/bash
export PS1="\w $ "
exec code-server "$@" "${HOME}/workspace"
