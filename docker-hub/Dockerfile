FROM dokify/dind:0.0.1

WORKDIR /app

COPY ./docker-hub/run_tests.sh /app/run_tests.sh
COPY .env.test /app/.env
COPY docker-compose.yml /app/docker-compose.yml
COPY Dockerfile /app/Dockerfile
COPY entrypoint.sh /app/entrypoint.sh

CMD ["/app/run_tests.sh"]
