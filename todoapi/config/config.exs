# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :todoapi,
  ecto_repos: [Todoapi.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :todoapi, TodoapiWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: TodoapiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Todoapi.PubSub,
  live_view: [signing_salt: "sd1+DXle"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# This config should be in ENV variables for safety purposes
config :todoapi, TodoapiWeb.Auth.Guardian,
  issuer: "todoapi",
  secret_key: "CsWkXt0S0ETYUKgV06w+6uBEUWg3aHs5IO2W+27D1UKo6Eo7Nf0Vu4rWBya5EVc1"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
