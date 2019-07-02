defmodule TeamService.Team do
  @moduledoc """
  Team
  """
  alias __MODULE__

  @type team :: :left|:right

  @type team :: %Team{team: team, members: list(pid())}
  defstruct team: nil, members: []

  use GenServer

  @spec start_link(team) :: GenServer.on_start
  def start_link(team), do: GenServer.start_link(__MODULE__, team)


  @spec add_player(pid) :: :ok
  def add_player(pid), do: GenServer.cast(pid, {:add_player, pid})

  @impl true
  def init(team), do: {:ok, %Team{team: team}}

  @impl true
  def handle_cast({:add_player, pid}, %Team{members: members} = team), do: {:noreply, %Team{team | members: [pid | members]}}
end
