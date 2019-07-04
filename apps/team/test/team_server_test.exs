defmodule Team.ServerTest do
  use ExUnit.Case

  alias Team.Server

  @moduletag :capture_log

  doctest Server

  test "module exists" do
    assert is_list(Server.module_info())
  end
end
