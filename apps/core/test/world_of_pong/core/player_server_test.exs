defmodule WorldOfPong.Core.PlayerServerTest do
  use ExUnit.Case

  alias WorldOfPong.Core.Player
  alias WorldOfPong.Core.PlayerServer

  @moduletag :capture_log

  doctest PlayerServer, import: true

  test "module exists" do
    assert is_list(PlayerServer.module_info())
  end
end
