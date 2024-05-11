defmodule Todoapi.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :status, :boolean, default: false
    field :title, :string
    belongs_to :user, Todoapi.Users.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:user_id, :title, :status])
    |> validate_required([:user_id, :title])
    |> put_default_status()
    |> assoc_constraint(:user)
  end

  def put_default_status(changeset) do
    case get_field(changeset, :status) do
      nil -> put_change(changeset, :status, false)
      _ -> changeset
    end
  end
end
