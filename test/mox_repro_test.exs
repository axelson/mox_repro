defmodule MoxReproTest do
  use ExUnit.Case
  doctest MoxRepro

  test "greets the world" do
    assert MoxRepro.hello() == :world
  end
end
