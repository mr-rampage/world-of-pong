defmodule WorldOfPong.Core.Player do
  alias __MODULE__

  @moduledoc """
  Player actor
  """

  @type t :: %Player{name: String.t(), readings: list(pos_integer)}
  defstruct name: "Player",
            readings: []

  @doc """
  Returns a player with a given name

  ## Example

    iex> new("Fred")
    %Player{name: "Fred", readings: []}

  """
  @spec new(String.t()) :: %Player{}
  def new(name), do: %Player{name: name}

  @doc """
  Returns a Player with the reading prepended

  ## Example

    iex> add_reading(%Player{name: "Fred"}, 5)
    { :ok, %Player{name: "Fred", readings: [5]} }
    iex> add_reading(%Player{name: "Fred"}, -1)
    { :error }

  """
  @spec add_reading(%Player{}, pos_integer) :: {:ok, %Player{}}
  def add_reading(%Player{readings: old_readings} = player, reading) when reading >= 0 do
    new_readings = [reading | old_readings]
    {:ok, %Player{player | readings: new_readings}}
  end

  @spec add_reading(%Player{}, neg_integer) :: {:error}
  def add_reading(_player, _reading), do: {:error}

  @doc """
  Returns a Player with empty readings

  ## Example

    iex> charlie = %Player{name: "Charlie", readings: [15]};
    iex> clear_readings(charlie);
    { :ok, %Player{name: "Charlie", readings: []} }

  """
  @spec clear_readings(%Player{}) :: %Player{}
  def clear_readings(%Player{} = player), do: {:ok, %Player{player | readings: []}}

  @doc """
  Returns a Player's average reading

  ## Example

    iex> charlie = %Player{name: "Charlie", readings: [15, 10, 11, 13, 15]}
    iex> average_reading(charlie);
    {:ok, 12.8}
    iex> average_reading(%Player{name: "Charlie", readings: []})
    {:error}

  """
  @spec average_reading(%Player{}) :: {:ok, float}
  def average_reading(%Player{readings: [_ | _] = readings}),
    do: {:ok, Enum.sum(readings) / length(readings)}

  @spec average_reading(%Player{}) :: {:error}
  def average_reading(_player), do: {:error}
end
