defmodule Todo.TodoItem do
  use Ecto.Schema

  schema "todo_items" do
    field :description, :string
    field :owner, :string
    field :finished, :boolean
  end
end
