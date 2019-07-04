defmodule Player.Server do
  @moduledoc false

  use GenServer

  import Player.Service

  @spec start_link(String.t()) :: GenServer.on_start()
  def start_link(player_name), do: GenServer.start_link(__MODULE__, player_name)

  @spec move(pid, pos_integer) :: :ok
  def move(pid, reading), do: GenServer.cast(pid, {:add_reading, reading})

  @spec get_location(pid) :: :get_location
  def get_location(pid), do: GenServer.call(pid, {:get_location})

  @impl true
  def init(player_name), do: {:ok, Player.new(player_name)}

  @impl true
  def handle_cast({:add_reading, reading}, player), do: {:noreply, add_reading(player, reading)}

  @impl true
  def handle_call({:get_location}, _pid, player), do: {:reply, average_reading(player), player}
end
