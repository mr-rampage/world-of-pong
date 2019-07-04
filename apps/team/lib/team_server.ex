defmodule Team.Server do
  @moduledoc false

  use GenServer

  @spec start_link(Team.side) :: GenServer.on_start()
  def start_link(team), do: GenServer.start_link(__MODULE__, team)

  @spec add_member(pid) :: :ok
  def add_member(member), do: GenServer.cast(__MODULE__, {:add_member, member})

  @impl true
  def init(team), do: {:ok, Team.new(team)}

  @impl true
  def handle_cast({:add_member, member}, team),
    do: {:noreply, Team.Service.add_member(member, team)}
end
