defmodule FormulaTest do
  use ExUnit.Case
  doctest Formula

  test "factorial of 4" do
    assert Formula.factorial(4) == 24
  end
end
