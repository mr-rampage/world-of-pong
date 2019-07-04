defmodule Team.Service do
  @moduledoc false

  @doc """
  ## Example

    iex> member = spawn(fn -> :ok end)
    iex> is_pid(member)
    true
    iex> add_member(member, %Team{team: :left})
    %Team{team: :left, members: [member]}

  """
  @spec add_member(pid, Team.team()) :: Team.team()
  def add_member(member, %Team{members: members} = team),
    do: %Team{team | members: [member | members]}
end
