defmodule PlayerService.Player.WebTest do
  use ExUnit.Case
  use PropCheck

  import Player.Service

  @moduletag :capture_log

  doctest Player.Service, import: true

  @tim %Player{name: "Tim", readings: [5]}

  property "add a reading",
    do:
      forall(
        reading <- pos_integer(),
        do:
          add_reading(@tim, reading).readings
          |> List.first()
          |> equals(reading)
      )

  property "always clear the readings",
    do:
      forall(
        readings <- list(pos_integer()),
        do:
          clear_readings(%Player{@tim | readings: readings}).readings
          |> equals([])
      )

  property "calculate the average reading",
    do:
      forall(
        readings <- list(pos_integer()),
        do:
          case average_reading(%Player{@tim | readings: readings}) do
            {:ok, _average} -> readings != []
            {:error} -> readings == []
          end
      )
end
