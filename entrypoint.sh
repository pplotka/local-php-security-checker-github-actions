#!/bin/sh -l
set -e

PATH=""
if [ ! -z "${INPUT_PATH}" ]; then
    PATH="--path=${INPUT_PATH}"
fi

FORMAT=""
if [ ! -z "${INPUT_FORMAT}" ]; then
    FORMAT="--path=${INPUT_FORMAT}"
fi

/security-checker --update-cache
/security-checker ${PATH} ${FORMAT} $*
