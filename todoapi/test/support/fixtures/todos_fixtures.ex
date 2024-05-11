defmodule Todoapi.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todoapi.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}, user_id) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        status: false,
        title: "some title",
        user_id: user_id
      })
      |> Todoapi.Todos.create_todo()

    todo
  end
end
