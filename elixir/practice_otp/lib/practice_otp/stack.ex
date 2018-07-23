defmodule PracticeOtp.Stack do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  def push(pid, item) do
    GenServer.cast(pid, {:push, item})
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
