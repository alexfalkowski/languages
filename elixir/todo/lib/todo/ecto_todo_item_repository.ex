defmodule Todo.EctoTodoItemRepository do
  @behaviour Todo.TodoItemRepository

  def save(item) do
    ecto_item = %Todo.Ecto.TodoItem{
      description: item.description,
      owner: item.owner,
      finished: item.finished
    }
    changeset = Todo.Ecto.TodoItem.changeset(ecto_item)

    {:ok, _} = Todo.Ecto.Repo.insert(changeset)

    item
  end
end
