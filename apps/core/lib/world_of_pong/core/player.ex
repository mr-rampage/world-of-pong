defmodule WorldOfPong.Core.Player do
  alias __MODULE__

  @type t :: %Player{name: String.t(), readings: list(pos_integer)}
  defstruct name: "Player", readings: []

  @callback new(String.t()) :: %Player{}
  @callback add_reading(%Player{}, pos_integer) :: {:ok, %Player{}}
  @callback clear_readings(%Player{}) :: %Player{}
  @callback average_reading(%Player{}) :: {:ok, float} | {:error}
end
