defmodule PlayerService.Player do
  alias __MODULE__

  @type player :: %Player{name: String.t(), readings: list(pos_integer)}
  defstruct name: "Player", readings: []

  @doc "Creates a player"
  @callback new(String.t()) :: player

  @doc "Adds a reading to a Player"
  @callback add_reading(player, pos_integer) :: player

  @doc "Clears all readings from a Player"
  @callback clear_readings(player) :: player

  @doc "Calculates the average reading for a Player"
  @callback average_reading(player) :: {:ok, float} | {:error}

  defmacro __using__(_) do
    quote do
      @doc """
      ## Example

        iex> new("Fred")
        %Player{name: "Fred", readings: []}
        iex> new("   ")
        %Player{name: "Player", readings: []}

      """
      def new(name) do
        normalized = String.trim(name)

        if String.length(normalized) > 0,
          do: %Player{name: normalized},
          else: %Player{}
      end
    end
  end
end
