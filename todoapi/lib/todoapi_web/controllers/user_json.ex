defmodule TodoapiWeb.UserJSON do
  alias Todoapi.Users.User

  @doc """
  Renders a single user.
  """
  def show(%{user: user, token: token}) do
    %{data: data(user, token)}
  end

  defp data(%User{} = user, token) do
    %{
      id: user.id,
      email: user.email,
      token: token
    }
  end
end
