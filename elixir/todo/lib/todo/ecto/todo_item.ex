defmodule Todo.Ecto.TodoItem do
  use Ecto.Schema

  schema "todo_items" do
    field :description, :string
    field :owner, :string
    field :finished, :boolean
  end

  def changeset(item, params \\ %{}) do
    attrs = [:description, :owner, :finished]
    item |> Ecto.Changeset.cast(params, attrs) |> Ecto.Changeset.validate_required(attrs)
  end
end
