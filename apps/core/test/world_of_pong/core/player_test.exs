defmodule WorldOfPong.Core.PlayerTest do
  use ExUnit.Case
  use PropCheck

  alias WorldOfPong.Core.Player

  @moduletag :capture_log

  doctest Player, import: true

  @tim %Player{name: "Tim", readings: [5]}

  property("always name a Player", [:verbose],
    do:
      forall(
        name <- :proper_types.string(),
        do:
          (Player.new(to_string(name)).name !== "")
          |> collect(String.trim(to_string(name)) == "")
      )
  )

  property "add a reading",
    do:
      forall(
        reading <- pos_integer(),
        do:
          Player.add_reading(@tim, reading).readings
          |> List.first
          |> equals(reading)
      )

  property "always clear the readings",
    do:
      forall(
        readings <- list(pos_integer()),
        do:
          Player.clear_readings(%Player{@tim | readings: readings}).readings
          |> equals([])
      )

  property "calculate the average reading",
    do:
      forall(
        readings <- list(pos_integer()),
        do:
          case Player.average_reading(%Player{@tim | readings: readings}) do
            {:ok, _average} -> readings != []
            {:error} -> readings == []
          end
      )
end
