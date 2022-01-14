#!/bin/sh -l
set -e

PATH=""
if [ ! -z "${INPUT_PATH}" ]; then
    PATH="--path=${INPUT_PATH}"
fi

FORMAT=""
if [ ! -z "${INPUT_FORMAT}" ]; then
    FORMAT="--format=${INPUT_FORMAT}"
fi

/security-checker --update-cache
output=$(/security-checker ${PATH} ${FORMAT} $*)
echo "$output"

if [ ! -z "${GITHUB_ACTIONS}" ]; then
    echo "::set-output name=security::$output"
fi
