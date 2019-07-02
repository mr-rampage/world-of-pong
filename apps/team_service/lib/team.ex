defmodule TeamService.Team do
  @moduledoc """
  Team
  """
  alias __MODULE__

  @type side :: :left | :right
  @type team :: %Team{team: side, members: list(pid)}
  defstruct team: nil, members: []

  use GenServer

  @spec start_link(side) :: GenServer.on_start()
  def start_link(team), do: GenServer.start_link(__MODULE__, team)

  @spec add_member(pid) :: :ok
  def add_member(member), do: GenServer.cast(__MODULE__, {:add_member, member})

  @impl true
  def init(team), do: {:ok, %Team{team: team}}

  @impl true
  def handle_cast({:add_member, member}, %Team{members: members} = team), do:
      {:noreply, %Team{team | members: [member | members]}}
end
