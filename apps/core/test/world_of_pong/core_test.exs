defmodule WorldOfPong.CoreTest do
  use ExUnit.Case
  doctest WorldOfPong.Core

  test "greets the world" do
    assert WorldOfPong.Core.hello() == :world
  end
end
