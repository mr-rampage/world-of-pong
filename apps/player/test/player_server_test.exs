defmodule PlayerService.ServerTest do
  use ExUnit.Case

  alias Player.Server

  @moduletag :capture_log

  doctest Player.Server, import: true

  test "module exists" do
    assert is_list(Server.module_info())
  end
end
