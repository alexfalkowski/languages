defmodule Bounce do
  def report(count) do
    receive do
      mmessage -> IO.puts("Received message:'#{mmessage}' with count:#{count}")
      report(count + 1)
    end
  end
end
