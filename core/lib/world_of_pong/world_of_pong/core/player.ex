defmodule WorldOfPong.Core.Player do
  @moduledoc """
  Player actor
  """

  @type t :: %__MODULE__{name: String.t, readings: list(pos_integer)}
  defstruct name: "", readings: []

  @doc """
  Creates a player with a given name

  ## Example

    iex> WorldOfPong.Core.Player.new("Fred")
    %WorldOfPong.Core.Player{name: "Fred", readings: []}

  """
  @spec new(String.t) :: %__MODULE__{}
  def new(name), do: %__MODULE__{name: name}

  @doc """
  Prepends a reading to a player

  ## Example

    iex> WorldOfPong.Core.Player.add_reading(WorldOfPong.Core.Player.new("Fred"), 5)
    %WorldOfPong.Core.Player{name: "Fred", readings: [5]}

  """
  @spec add_reading(%__MODULE__{}, pos_integer) :: %__MODULE__{}
  def add_reading(%__MODULE__{readings: old_readings} = player, reading) do
    new_readings = [reading | old_readings]
    %__MODULE__{player | readings: new_readings}
  end

  @doc """
  Clears all readings from a player

  ## Example

    iex> charlie = %WorldOfPong.Core.Player{name: "Charlie", readings: [15]};
    iex> WorldOfPong.Core.Player.clear_readings(charlie);
    %WorldOfPong.Core.Player{name: "Charlie", readings: []}

  """
  @spec clear_readings(%__MODULE__{}) :: %__MODULE__{}
  def clear_readings(player) do
    %__MODULE__{player | readings: []}
  end

  @doc """
  Calculates the average position of a player

  ## Example

    iex> charlie = %WorldOfPong.Core.Player{name: "Charlie", readings: [15, 10, 11, 13, 15]};
    iex> WorldOfPong.Core.Player.average_reading(charlie);
    {:ok, 12.8}
    iex> WorldOfPong.Core.Player.average_reading(WorldOfPong.Core.Player.new("Charlie"))
    {:error}

  """
  @spec average_reading(%__MODULE__{}) :: {:error}
  def average_reading(%__MODULE__{readings: []}) do
    {:error}
  end

  @spec average_reading(%__MODULE__{}) :: {:ok, float}
  def average_reading(%__MODULE__{readings: readings}) do
    {:ok, Enum.sum(readings) / length(readings)}
  end
end
