#!/bin/sh -l
set -e

CACHE_DIR=""
if [ ! -z "${INPUT_CACHE_DIR}" ]; then
    CACHE_DIR="--cache-dir=${INPUT_CACHE_DIR}"
fi

PATH=""
if [ ! -z "${INPUT_PATH}" ]; then
    PATH="--path=${INPUT_PATH}"
fi

FORMAT=""
if [ ! -z "${INPUT_FORMAT}" ]; then
    FORMAT="--format=${INPUT_FORMAT}"
fi

/security-checker --update-cache ${CACHE_DIR}
output=$(/security-checker --local ${CACHE_DIR} ${PATH} ${FORMAT} $*)
echo "$output"

if [ ! -z "${GITHUB_ACTIONS}" ]; then
    output="${output//'%'/'%25'}"
    output="${output//$'\n'/'%0A'}"
    output="${output//$'\r'/'%0D'}"
    echo "::set-output name=security::$output"
fi
