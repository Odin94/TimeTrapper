#!/usr/bin/env bash
set -e -o pipefail

docker-compose -p time-trapper-postgresql --file "./docker/docker-compose.yaml" up --build --detach
