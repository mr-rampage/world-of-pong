defmodule WorldOfPong.Core.PlayerTest do
  use ExUnit.Case
  use PropCheck

  alias WorldOfPong.Core.Player
  doctest WorldOfPong.Core.Player, import: true

  @tim %Player{ name: "Tim", readings: [ 5 ] }

  property "given a non-empty name, always create a Player", do:
    forall x <- :proper_types.string( ), do:
      equals( %Player{ name: x, readings: [ ] }, Player.new( x ) )

  property "given a positive reading, always prepend to the player's readings", do:
    forall x <- pos_integer( ), do:
      equals( { :ok, %Player{ @tim | readings: [ x, 5 ] } }, Player.add_reading( @tim, x ) )

  property "given a negative reading, always error out", do:
    forall x <- neg_integer( ), do:
      equals( { :error }, Player.add_reading( @tim, x ) )

  property "given a Player with readings, always clear the readings", do:
    forall readings <- list( pos_integer( ) ), do:
      equals( { :ok, Player.new( "Tim" ) }, Player.clear_readings( %Player{ @tim | readings: readings } ) )

  property "given a Player with readings, always calculate the average reading", do:
    forall readings <- non_empty( list( pos_integer( ) ) ), do:
      equals( :ok, elem( Player.average_reading( %Player{ @tim | readings: readings } ), 0 ) )
end
