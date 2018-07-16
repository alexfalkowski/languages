defmodule Drop do
  def drop() do
    receive do
      {from, planet, distance} ->
        send(from, {planet, distance, fall_velocity(planet, distance)})
        drop()
    end
  end

  def fall_velocity(:earth, distance) when distance >= 0 do
    fall_velocity_of_planet(9.8, distance)
  end

  def fall_velocity(:moon, distance) when distance >= 0 do
    fall_velocity_of_planet(1.6, distance)
  end

  def fall_velocity(:mars, distance) when distance >= 0 do
    fall_velocity_of_planet(3.71, distance)
  end

  defp fall_velocity_of_planet(const, distance) do
    :math.sqrt(2 * const * distance)
  end
end
