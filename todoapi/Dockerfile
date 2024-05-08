FROM elixir:1.16.2-alpine

RUN mix local.hex --force && \
    mix local.rebar --force

COPY . .

RUN mix do deps.get, deps.compile

CMD ["mix", "phx.server"]
