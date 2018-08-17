defmodule Todo.Repo.Migrations.CreateTodoItems do
  use Ecto.Migration

  def change do
    create table(:todo_items) do
      add :description, :string
      add :owner, :string
      add :finished, :boolean
    end
  end
end
