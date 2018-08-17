defmodule Todo.TodoItem do
  defstruct description: "", owner: "", finished: false

  def create_unfinished(description, owner) do
    create(description, owner, false)
  end

  def create_finished(description, owner) do
    create(description, owner, true)
  end

  def create(description, owner, finished) do
    %Todo.TodoItem{description: description, owner: owner, finished: finished}
  end
end
