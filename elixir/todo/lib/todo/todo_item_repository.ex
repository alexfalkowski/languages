defmodule Todo.TodoItemRepository do
  @callback save(Todo.TodoItem.t) :: {:ok, term} | {:error, String.t}
end
