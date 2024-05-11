#!/bin/sh
echo "Setting up database and starting the app..."
mix ecto.create
mix ecto.migrate
mix run priv/repo/seeds.exs
exec mix phx.server