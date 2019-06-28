defmodule PlayerService.ServerTest do
  use ExUnit.Case

  alias PlayerService.Server

  @moduletag :capture_log

  doctest PlayerService.Server, import: true

  test "module exists" do
    assert is_list(Server.module_info())
  end
end
