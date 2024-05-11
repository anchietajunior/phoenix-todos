defmodule Todoapi.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todoapi.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "user@test.com",
        hash_password: Bcrypt.hash_pwd_salt("123456")
      })
      |> Todoapi.Users.create_user()
    user
  end
end
