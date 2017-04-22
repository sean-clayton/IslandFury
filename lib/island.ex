defmodule IslandFury.Island do
  alias IslandFury.Coordinate

  def start_link() do
    # Initial state is an empty list
    Agent.start_link(fn -> [] end)
  end

  def get_state(island) do
    Agent.get(island, fn state -> state end)
  end

  def forested?(island) do
    island
    |> get_state
    |> Enum.all?(fn coord -> Coordinate.hit?(coord) end)
  end

  def replace_coordinates(island, new_coordinates) when is_list new_coordinates do
    Agent.update(island, fn _state -> new_coordinates end)
  end
end