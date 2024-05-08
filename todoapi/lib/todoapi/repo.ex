defmodule Todoapi.Repo do
  use Ecto.Repo,
    otp_app: :todoapi,
    adapter: Ecto.Adapters.Postgres
end
