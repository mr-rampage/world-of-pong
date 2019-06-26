defmodule WorldOfPong.Core.Player do
  alias __MODULE__

  @type t :: %Player{name: String.t(), readings: list(pos_integer)}
  defstruct name: "Player", readings: []

  @doc """
  Returns a player with a given name

  ## Example

    iex> new("Fred")
    %Player{name: "Fred", readings: []}
    iex> new("   ")
    %Player{name: "Player", readings: []}

  """
  def new(name) do
    normalized = String.trim(name)
    if String.length(normalized) > 0, do: %Player{name: normalized}, else: %Player{}
  end

  @callback new(String.t()) :: %Player{}

  @doc "Adds a reading to a Player"
  @callback add_reading(%Player{}, pos_integer) :: {:ok, %Player{}}

  @doc "Clears all readings from a Player"
  @callback clear_readings(%Player{}) :: %Player{}

  @doc "Calculates the average reading for a Player"
  @callback average_reading(%Player{}) :: {:ok, float} | {:error}
end
