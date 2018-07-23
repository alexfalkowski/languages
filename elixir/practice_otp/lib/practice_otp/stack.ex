defmodule PracticeOtp.Stack do
  use GenServer

  @name __MODULE__

  def start_link() do
    GenServer.start_link(@name, [], name: @name)
  end

  def pop() do
    GenServer.call(@name, :pop)
  end

  def push(item) do
    GenServer.cast(@name, {:push, item})
  end

  # Callbacks

  def init(stack) do
    {:ok, stack}
  end

  def handle_call(:pop, _from, [h | t]) do
    {:reply, h, t}
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end
end
