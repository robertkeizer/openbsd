defmodule OpenbsdTest do
  use ExUnit.Case
  doctest Openbsd

  test "greets the world" do
    assert Openbsd.hello() == :world
  end
end
