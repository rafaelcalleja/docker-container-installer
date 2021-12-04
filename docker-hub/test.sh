#!/bin/bash

docker-compose -p "$(basename "$(pwd)")_test" -f docker-compose.test.yml down -v --rmi local
timeout 300 docker-compose -p "$(basename "$(pwd)")_test" -f docker-compose.test.yml up --build -V --exit-code-from sut
