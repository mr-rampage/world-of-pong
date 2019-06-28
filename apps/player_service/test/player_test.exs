defmodule PlayerService.PlayerTest do
  use ExUnit.Case
  use PropCheck
  use PlayerService.Player

  @moduletag :capture_log

  doctest PlayerService.Player, import: true

  property("always name a Player", [:verbose],
    do:
      forall(
        name <- :proper_types.string(),
        do:
          (new(to_string(name)).name !== "")
          |> collect(String.trim(to_string(name)) == "")
      )
  )
end
