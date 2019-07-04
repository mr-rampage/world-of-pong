defmodule Player do
  alias __MODULE__

  @type player :: %Player{name: String.t(), readings: list(pos_integer)}
  defstruct name: "Player", readings: []

  @doc """
  ## Example

    iex> new("Fred")
    %Player{name: "Fred", readings: []}
    iex> new("   ")
    %Player{name: "Player", readings: []}

  """
  @spec new(String.t()) :: player
  def new(name) do
    normalized = String.trim(name)

    if String.length(normalized) > 0,
       do: %Player{name: normalized},
       else: %Player{}
  end
end
