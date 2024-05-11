defmodule TodoapiWeb.TodoControllerTest do
  use TodoapiWeb.ConnCase

  # import Todoapi.TodosFixtures
  # import Todoapi.UsersFixtures

  # @create_attrs %{
  #   status: true,
  #   title: "some title"
  # }
  # @update_attrs %{
  #   status: false,
  #   title: "some updated title"
  # }
  # @invalid_attrs %{status: nil, title: nil}

  # setup %{conn: conn} do
  #   user = user_fixture()
  #   conn = assign(conn, :user, user)
  #   {:ok, conn: put_req_header(conn, "accept", "application/json"), user: user}
  # end

  # describe "index" do
  #   test "lists all todos", %{conn: conn} do
  #     conn = get(conn, ~p"/api/todos")
  #     assert json_response(conn, 200)["data"] == []
  #   end
  # end

  # describe "create todo" do
  #   test "renders todo when data is valid", %{conn: conn} do
  #     conn = post(conn, ~p"/api/todos", todo: @create_attrs)
  #     assert %{"id" => id} = json_response(conn, 201)["data"]

  #     conn = get(conn, ~p"/api/todos/#{id}")

  #     assert %{
  #              "id" => ^id,
  #              "status" => true,
  #              "title" => "some title"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn = post(conn, ~p"/api/todos", todo: @invalid_attrs)
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "update todo" do
  #   setup [:create_todo]

  #   test "renders todo when data is valid", %{conn: conn, todo: %Todo{id: id} = todo} do
  #     conn = put(conn, ~p"/api/todos/#{todo}", todo: @update_attrs)
  #     assert %{"id" => ^id} = json_response(conn, 200)["data"]

  #     conn = get(conn, ~p"/api/todos/#{id}")

  #     assert %{
  #              "id" => ^id,
  #              "status" => false,
  #              "title" => "some updated title"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn, todo: todo} do
  #     conn = put(conn, ~p"/api/todos/#{todo}", todo: @invalid_attrs)
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "delete todo" do
  #   setup [:create_todo]

  #   test "deletes chosen todo", %{conn: conn, todo: todo} do
  #     conn = delete(conn, ~p"/api/todos/#{todo}")
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, ~p"/api/todos/#{todo}")
  #     end
  #   end
  # end

  # defp create_todo(_) do
  #   user = user_fixture()
  #   todo = todo_fixture(%{}, user.id)
  #   %{todo: todo}
  # end
end
