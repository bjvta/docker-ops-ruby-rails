FROM ruby:alpine3.11 as base

RUN set -eux \
# Packages from testing
    && apk add \
        --no-cache \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
# Docker tools
        gosu \
        tini

RUN set -eux \
    && apk add \
        --no-cache  \
# Common tools for development and building
        git \
        unzip \
        curl \
        gettext \
        tzdata \
        build-base \
        bash

# Install node yarn
RUN set -eux \
    & apk add \
        --no-cache \
        nodejs \
        yarn

# Library headers to build ruby rails packages
RUN set -eux \
    & apk add \
        --no-cache \
        ruby-etc \
        ruby-bigdecimal \
        ruby-io-console \
        ruby-irb \
        ca-certificates \
        libressl \
# tools database
        postgresql-dev

# Setup non-root user
RUN set -eux \
    \
    && addgroup -g 1000 app \
    && adduser -u 1000 -G app -H -D app \
    \
    && mkdir -p /app

ENV LANG="C.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_COLLATE="C" \
    GEM_HOME="/usr/local/bundle"

# Setup folder root
WORKDIR "/app"

EXPOSE 8000

COPY entrypoint-base.sh /sbin/docker-entrypoint.sh

ENTRYPOINT ["tini", "--", "/sbin/docker-entrypoint.sh"]

FROM base as develop

COPY ./skel /etc/skel

RUN set -eux \
    && mkdir /home/app \
    && chown app:app -R /home/app \
    && gosu app cp -R /etc/skel/. /home/app/

RUN bundle config build.nokogiri --use-system-librarie

VOLUME /home/app

COPY entrypoint-development.sh /sbin/docker-entrypoint.sh
