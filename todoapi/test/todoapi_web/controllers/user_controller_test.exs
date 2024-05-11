defmodule TodoapiWeb.UserControllerTest do
  use TodoapiWeb.ConnCase

  import Todoapi.UsersFixtures

  @invalid_attrs %{email: "user@test.com", hash_password: "wrongpassword"}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  setup do
    user = user_fixture()
    {:ok, user: user}
  end

  # test "sign_in with valid credentials", %{conn: conn, user: user} do
  #   conn = post(conn, "/api/users/sign_in", %{
  #     email: "user@test.com",
  #     hash_password: "123456"
  #   })
  #   assert %{"data" => %{"token" => token}} = json_response(conn, 200)
  #   assert get_session(conn, :user_id) == user.id
  # end

  test "sign_in with invalid credentials", %{conn: conn} do
    conn = post(conn, "/api/users/sign_in", @invalid_attrs)
    assert %{"error" => _reason} = json_response(conn, 401)
  end
end
