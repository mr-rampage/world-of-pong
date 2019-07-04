defmodule Team do
  @moduledoc """
  Team
  """
  alias __MODULE__

  @type side :: :left | :right
  @type team :: %Team{team: side, members: list(pid)}
  defstruct team: nil, members: []

  @spec new(side) :: team
  def new(side), do: %Team{team: side}
end
