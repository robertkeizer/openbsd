defmodule OpenbsdTest.NIF do
  use ExUnit.Case
  doctest Openbsd.NIF

  alias Openbsd.NIF

  test "add" do
    assert 4 == NIF.add(1, 3)
  end
end
