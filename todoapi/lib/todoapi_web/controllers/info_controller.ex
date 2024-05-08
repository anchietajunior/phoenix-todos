defmodule TodoapiWeb.InfoController do
  use TodoapiWeb, :controller

  def index(conn, _params) do
    json(conn, %{name: "todoapi", version: "1.0"})
  end
end
