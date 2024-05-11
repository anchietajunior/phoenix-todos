defmodule TodoapiWeb.TodoController do
  use TodoapiWeb, :controller

  alias Todoapi.Todos
  alias Todoapi.Todos.Todo

  action_fallback TodoapiWeb.FallbackController

  def index(conn, _params) do
    todos = Todos.list_todos(conn.assigns.user.id)
    render(conn, :index, todos: todos)
  end

  def create(conn, %{"todo" => todo_params}) do
    user = conn.assigns.user
    todo_params = Map.put(todo_params, "user_id", user.id)

    with {:ok, %Todo{} = todo} <- Todos.create_todo(todo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/todos/#{todo}")
      |> render(:show, todo: todo)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   user = conn.assigns.user

  #   case Todos.get_todo!(id, user.id) do
  #     nil ->
  #       conn
  #       |> put_status(:not_found)
  #       |> json(%{error: "Todo not found"})
  #     todo ->
  #       render(conn, :show, todo: todo)
  #   end
  # end

  def show(conn, %{"id" => id}) do
    user = conn.assigns.user

    case Todos.get_todo!(id, user.id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Todo not found"})
      todo ->
        render(conn, :show, todo: todo)
    end
  rescue
    Ecto.NoResultsError ->
      conn
      |> put_status(:not_found)
      |> json(%{error: "Todo not found"})
  end

  def update(conn, %{"id" => id, "todo" => todo_params}) do
    user = conn.assigns.user
    todo = Todos.get_todo!(id, user.id)

    with {:ok, %Todo{} = todo} <- Todos.update_todo(todo, todo_params) do
      render(conn, :show, todo: todo)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = conn.assigns.user
    todo = Todos.get_todo!(id, user.id)

    with {:ok, %Todo{}} <- Todos.delete_todo(todo) do
      send_resp(conn, :no_content, "")
    end
  end
end
