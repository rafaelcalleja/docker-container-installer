#!/bin/bash

set -x
set -o errexit
set -o nounset

DIRECTORY=/tmp/php

if [ -d "${DIRECTORY}" ]; then
    echo "${DIRECTORY} already exists."
    exit 127
fi

docker-compose --env-file .env up

if [ ! -d "${DIRECTORY}" ]; then
    echo "${DIRECTORY} does not exists."
    exit 127
fi
