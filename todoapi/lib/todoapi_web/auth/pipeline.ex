defmodule TodoapiWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :todoapi,
    module: TodoapiWeb.Auth.Guardian,
    error_handler: TodoapiWeb.Auth.GuardianErrorHandler

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
