defmodule PlayerService.PlayerTest do
  use ExUnit.Case
  use PropCheck
  @moduletag :capture_log

  doctest Player, import: true

  property("always name a Player", [:verbose],
    do:
      forall(
        name <- :proper_types.string(),
        do:
          (Player.new(to_string(name)).name !== "")
          |> collect(String.trim(to_string(name)) == "")
      )
  )
end
