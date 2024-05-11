defmodule Todoapi.TodosTest do
  use Todoapi.DataCase

  alias Todoapi.Todos

  describe "todos" do
    alias Todoapi.Todos.Todo

    import Todoapi.TodosFixtures
    import Todoapi.UsersFixtures

    @invalid_attrs %{title: nil, user_id: nil}

    test "list_todos/1 returns all todos" do
      user = user_fixture()
      todo = todo_fixture(%{}, user.id)
      assert Todos.list_todos(user.id) == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      user = user_fixture()
      todo = todo_fixture(%{}, user.id)
      assert Todos.get_todo!(todo.id, user.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      user = user_fixture()
      valid_attrs = %{status: true, title: "some title", user_id: user.id}

      assert {:ok, %Todo{} = todo} = Todos.create_todo(valid_attrs)
      assert todo.status == true
      assert todo.title == "some title"
      assert todo.user_id == user.id
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      user = user_fixture()
      todo = todo_fixture(%{}, user.id)
      update_attrs = %{status: false, title: "some updated title"}

      assert {:ok, %Todo{} = todo} = Todos.update_todo(todo, update_attrs)
      assert todo.status == false
      assert todo.title == "some updated title"
      assert todo.user_id == user.id
    end

    test "update_todo/2 with invalid data returns error changeset" do
      user = user_fixture()
      todo = todo_fixture(%{}, user.id)
      assert {:error, %Ecto.Changeset{}} = Todos.update_todo(todo, @invalid_attrs)
      assert todo == Todos.get_todo!(todo.id, user.id)
    end

    test "delete_todo/1 deletes the todo" do
      user = user_fixture()
      todo = todo_fixture(%{}, user.id)
      assert {:ok, %Todo{}} = Todos.delete_todo(todo)
    end
  end
end
