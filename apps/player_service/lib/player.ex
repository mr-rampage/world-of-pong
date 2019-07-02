defmodule PlayerService.Player do
  alias __MODULE__

  @type team :: :left|:right

  @type player :: %Player{name: String.t(), team: team, readings: list(pos_integer)}
  defstruct name: "Player", team: nil, readings: []

  @doc "Creates a player"
  @callback new(String.t(), team) :: player

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

        iex> new("Fred", :left)
        %Player{name: "Fred", team: :left, readings: []}
        iex> new("   ", :right)
        %Player{name: "Player", team: :right, readings: []}

      """
      def new(name, team) do
        normalized = String.trim(name)

        if String.length(normalized) > 0,
          do: %Player{name: normalized, team: team},
          else: %Player{team: team}
      end
    end
  end
end
