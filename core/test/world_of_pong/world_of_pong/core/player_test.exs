defmodule WorldOfPong.Core.PlayerTest do
  use ExUnit.Case
  use PropCheck

  alias WorldOfPong.Core.Player
  doctest WorldOfPong.Core.Player, import: true

  @tim %Player{name: "Tim", readings: [5]}

  property "always name a Player",
    do:
      forall(
        name <- :proper_types.string(),
        do: String.length(Player.new(to_string(name)).name) > 0
      )

  property "add a readings",
    do:
      forall(
        reading <- integer(),
        do:
          case Player.add_reading(@tim, reading) do
            {:ok, _player} -> reading >= 0
            {:error} -> reading < 0
          end
      )

  property "always clear the readings",
    do:
      forall(
        readings <- list(pos_integer()),
        do:
          %Player{@tim | readings: readings}
          |> Player.clear_readings()
          |> equals({:ok, %Player{@tim | readings: []}})
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
