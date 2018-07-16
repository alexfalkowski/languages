defmodule Drop do
  def drop() do
    receive do
      {from, planet, distance} ->
        send(from, {planet, distance, fall_velocity(planet, distance)})
        drop()
    end
  end

  def fall_velocity(:earth, distance) do
    fall_velocity_of_planet(9.8, distance)
  end

  def fall_velocity(:moon, distance) do
    fall_velocity_of_planet(1.6, distance)
  end

  def fall_velocity(:mars, distance) do
    fall_velocity_of_planet(3.71, distance)
  end

  defp fall_velocity_of_planet(const, distance) do
    try do
      {:ok, :math.sqrt(2 * const * distance)}
    rescue
      error -> {:error, error.message}
    end
  end
end
