FROM docker:dind

RUN apk add --no-cache curl bash &&  \
    cd /usr/local/share/ && \
    curl -sSL https://github.com/kward/shflags/archive/v1.2.3.tar.gz |tar xvz

COPY entrypoint.sh /entrypoint.sh

USER root

ENTRYPOINT ["/entrypoint.sh"]
