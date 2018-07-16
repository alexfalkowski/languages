defmodule Drop do
  def fall_velocity({:earth, distance}) when distance >= 0 do
    fall_velocity(9.8, distance)
  end

  def fall_velocity({:moon, distance}) when distance >= 0 do
    fall_velocity(1.6, distance)
  end

  def fall_velocity({:mars, distance}) when distance >= 0 do
    fall_velocity(3.71, distance)
  end

  defp fall_velocity(const, distance) do
    :math.sqrt(2 * const * distance)
  end
end
