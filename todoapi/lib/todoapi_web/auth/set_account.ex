defmodule TodoapiWeb.Auth.SetAccount do
  import Plug.Conn
  alias TodoapiWeb.Auth.ErrorResponse

  def init(opts), do: opts

  def call(conn, _opts) do
    if conn.assigns[:user] do
      conn
    else
      case Guardian.Plug.current_resource(conn) do
        nil -> raise ErrorResponse.Unauthorized
        user -> assign(conn, :user, user)
      end
    end
  end
end
