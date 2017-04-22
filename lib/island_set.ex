defmodule IslandFury.IslandSet do
  alias IslandFury.{Island, IslandSet}

  defstruct atoll: :none, dot: :none, l_shape: :none, s_shape: :none, square: :none

  def start_link() do
    Agent.start_link(fn -> initialized_set() end)
  end

  def get_state(island_set) do
    Agent.get(island_set, fn state -> state end)
  end

  def initialized_set() do
    Enum.reduce(keys(), %IslandSet{}, fn key, set ->
      {:ok, island} = Island.start_link
      Map.put(set, key, island)
    end)
  end

  def keys() do
    %IslandSet{}
    |> Map.from_struct
    |> Map.keys
  end
end