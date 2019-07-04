defmodule PlayerService.Player.WebTest do
  use ExUnit.Case

  @moduletag :capture_log

  doctest Team.Service, import: true
end
