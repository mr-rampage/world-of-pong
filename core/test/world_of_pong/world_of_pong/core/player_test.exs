defmodule WorldOfPong.Core.PlayerTest do
  use ExUnit.Case
  use PropCheck

  alias WorldOfPong.Core.Player
  doctest WorldOfPong.Core.Player, import: true

  property "given a non-empty name, always create a Player" do
    forall x <- :proper_types.string() do
      Player.new( x ) == %Player{ name: x, readings: [ ] }
    end
  end

  property "given a positive reading, always prepend to the player's readings" do
    tim = %Player{ name: "Tim", readings: [ 5 ] }
    forall x <- :proper_types.pos_integer() do
      Player.add_reading( tim, x ) == { :ok, %Player{ name: "Tim", readings: [ x, 5 ] } }
    end
  end

  property "given a negative reading, always error out" do
    tim = %Player{ name: "Tim", readings: [ 5 ] }
    forall x <- :proper_types.neg_integer() do
      Player.add_reading( tim, x ) == { :error }
    end
  end

  property "given a Player with readings, always clear the readings" do
    forall readings <- list(pos_integer()) do
      Player.clear_readings(%Player{ name: "Tim", readings: readings }) == {:ok, Player.new("Tim") }
    end
  end

  property "given a Player with readings, always calculate the average reading" do
    forall readings <- non_empty(list(pos_integer())) do
      elem(Player.average_reading(%Player{ name: "Tim", readings: readings }), 0) == :ok
    end
  end
end
