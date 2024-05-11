defmodule TodoapiWeb.UserController do
  use TodoapiWeb, :controller

  alias TodoapiWeb.Auth.Guardian

  action_fallback TodoapiWeb.FallbackController

  def sign_in(conn, %{"email" => email, "hash_password" => hash_password}) do
    case Guardian.authenticate(email, hash_password) do
      {:ok, user, token} ->
        conn
        |> Plug.Conn.put_session(:user_id, user.id)
        |> put_status(:ok)
        |> put_view(TodoapiWeb.UserJSON)
        |> render("show.json", user: user, token: token)
      {:error, reason} ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: reason})
    end
  end
end
