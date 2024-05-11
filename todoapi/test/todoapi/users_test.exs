defmodule Todoapi.UsersTest do
  use Todoapi.DataCase

  alias Todoapi.Users

  describe "users" do
    import Todoapi.UsersFixtures

    test "get_user_by_email!/1 returns the user with given email" do
      user = user_fixture()
      assert Users.get_user_by_email(user.email) == user
    end

    test "get_user_by_email!/1 with a wrong email returns nil" do
      assert Users.get_user_by_email("nonexisting@user.com") == nil
    end
  end
end
