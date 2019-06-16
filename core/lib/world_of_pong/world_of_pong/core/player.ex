defmodule WorldOfPong.Core.Player do
  alias __MODULE__

  @moduledoc """
  Player actor
  """

  @type t :: %Player{ name: String.t, readings: list( pos_integer ) }
  defstruct name: "Player", readings: [ ]

  @doc """
  Creates a player with a given name

  ## Example

    iex> new("Fred")
    %Player{name: "Fred", readings: []}

  """
  @spec new( String.t ) :: %Player{ }
  def new( name ), do: %Player{ name: name }

  @doc """
  Prepends a reading to a player

  ## Example

    iex> add_reading(%Player{name: "Fred"}, 5)
    %Player{name: "Fred", readings: [5]}

  """
  @spec add_reading( %Player{ }, pos_integer ) :: %Player{ }
  def add_reading( %Player{ readings: old_readings } = player, reading ) do
    new_readings = [ reading | old_readings ]
    %Player{ player | readings: new_readings }
  end

  @doc """
  Clears all readings from a player

  ## Example

    iex> charlie = %Player{name: "Charlie", readings: [15]};
    iex> clear_readings(charlie);
    %Player{name: "Charlie", readings: []}

  """
  @spec clear_readings( %Player{ } ) :: %Player{ }
  def clear_readings( player ) do
    %Player{ player | readings: [ ] }
  end

  @doc """
  Calculates the average position of a player

  ## Example

    iex> charlie = %Player{name: "Charlie", readings: [15, 10, 11, 13, 15]};
    iex> average_reading(charlie);
    {:ok, 12.8}
    iex> average_reading(%Player{name: "Charlie", readings: []})
    {:error}

  """
  @spec average_reading( %Player{ } ) :: { :error }
  def average_reading( %Player{ readings: [ ] } ) do
    { :error }
  end

  @spec average_reading( %Player{ } ) :: { :ok, float }
  def average_reading( %Player{ readings: readings } ) do
    { :ok, Enum.sum( readings ) / length( readings ) }
  end
end
