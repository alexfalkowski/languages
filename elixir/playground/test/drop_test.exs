defmodule DropTest do
  use ExUnit.Case
  doctest Drop

  test "the earth" do
    assert Drop.fall_velocity(:earth, 20) == 19.79898987322333
  end

  test "the moon" do
    assert Drop.fall_velocity(:moon, 20) == 8.0
  end

  test "mars" do
    assert Drop.fall_velocity(:mars, 20) == 12.181953866272849
  end
end
