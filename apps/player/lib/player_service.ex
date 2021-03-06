defmodule Player.Service do
  alias __MODULE__

  @doc """
  Returns a Player with the reading prepended

  ## Example

    iex> add_reading(%Player{name: "Fred"}, 5)
    %Player{name: "Fred", readings: [5]}

  """
  @spec add_reading(Player.player, pos_integer) :: Player.player
  def add_reading(%Player{readings: old_readings} = player, reading) when reading >= 0 do
    new_readings = [reading | old_readings]
    %Player{player | readings: new_readings}
  end

  @doc """
  Returns a Player with empty readings

  ## Example

    iex> charlie = %Player{name: "Charlie", readings: [15]};
    iex> clear_readings(charlie);
    %Player{name: "Charlie", readings: []}

  """
  @spec clear_readings(Player.player) :: Player.player
  def clear_readings(%Player{} = player), do: %Player{player | readings: []}

  @doc """
  Returns a Player's average reading

  ## Example

    iex> charlie = %Player{name: "Charlie", readings: [15, 10, 11, 13, 15]}
    iex> average_reading(charlie);
    {:ok, 12.8}
    iex> average_reading(%Player{name: "Charlie", readings: []})
    {:error}

  """
  @spec average_reading(Player.player) :: {:ok, float} | {:error}
  def average_reading(%Player{readings: [_ | _] = readings}),
    do: {:ok, Enum.sum(readings) / length(readings)}

  def average_reading(_player), do: {:error}
end
