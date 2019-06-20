defmodule WorldOfPong.Core.PlayerServer do
  @moduledoc false

  use GenServer

  alias WorldOfPong.Core.Player

  def start_link(player_name), do: GenServer.start_link(__MODULE__, player_name)

  @spec move(pid, pos_integer) :: :ok
  def move(pid, reading), do: GenServer.cast(pid, {:add_reading, reading})

  @spec get_location(pid) :: :get_location
  def get_location(pid), do: GenServer.call(pid, {:get_location})

  @impl true
  def init(player_name), do: {:ok, Player.new(player_name)}

  @impl true
  def handle_cast({:add_reading, reading}, player), do: {:noreply, Player.add_reading(player, reading)}

  @impl true
  def handle_call({:get_location}, _pid, player), do: {:reply, Player.average_reading(player)}
end