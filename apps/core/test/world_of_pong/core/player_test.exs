defmodule WorldOfPong.Core.PlayerTest do
  use ExUnit.Case
  use PropCheck

  alias WorldOfPong.Core.Player

  @moduletag :capture_log

  doctest WorldOfPong.Core.Player, import: true

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