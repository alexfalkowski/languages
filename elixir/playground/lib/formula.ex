defmodule Formula do
  def factorial(n) do
    factorial(1, n, 1)
  end

  defp factorial(current, n, result) when current <= n do
    new_result = result * current
    factorial(current + 1, n, new_result)
  end

  defp factorial(_current, _n, result) do
    result
  end
end
