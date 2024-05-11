FROM elixir:1.16.2-alpine

WORKDIR /app

RUN apk --no-cache add build-base

RUN mix local.hex --force && \
    mix local.rebar --force

COPY . .

RUN mix do deps.get, deps.compile