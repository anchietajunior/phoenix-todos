defmodule TodoapiWeb.Router do
  use TodoapiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TodoapiWeb do
    pipe_through :api
  end

  scope "/", TodoapiWeb do
    pipe_through :api

    get "/", InfoController, :index
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:todoapi, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: TodoapiWeb.Telemetry
    end
  end
end
