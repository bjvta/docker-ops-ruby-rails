FROM ruby-alpine:latest

ENV ENVIRONMENT production
ENV RAILS_ENV production
ENV RACK_ENV production

COPY ./labtrendig .

RUN set -eux; \
    bundle config set path 'vendor/bundle'
RUN set -eux; \
    bundle install --without development test

RUN set -eux; \
    bundle exec rake assets:precompile

COPY entrypoint.sh ./entrypoint.sh


EXPOSE 8000
EXPOSE 8001

ENTRYPOINT ./entrypoint.sh