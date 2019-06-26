defmodule WorldOfPong.Core.WebPlayer do
  @behaviour WorldOfPong.Core.Player

  alias __MODULE__

  @moduledoc """
  Player actor for the Web
  """
  alias WorldOfPong.Core.Player

  @doc """
  Returns a player with a given name

  ## Example

    iex> new("Fred")
    %Player{name: "Fred", readings: []}
    iex> new("   ")
    %Player{name: "Player", readings: []}

  """
  @impl true
  def new(name) do
    normalized = String.trim(name)
    if String.length(normalized) > 0, do: %Player{name: normalized}, else: %Player{}
  end

  @doc """
  Returns a Player with the reading prepended

  ## Example

    iex> add_reading(%Player{name: "Fred"}, 5)
    %Player{name: "Fred", readings: [5]}

  """
  @impl true
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
  @impl true
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
  @impl true
  def average_reading(%Player{readings: [_ | _] = readings}),
      do: {:ok, Enum.sum(readings) / length(readings)}

  @impl true
  def average_reading(_player), do: {:error}

end