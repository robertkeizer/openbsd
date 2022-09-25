defmodule OpenbsdTest.NIF do
  use ExUnit.Case
  doctest Openbsd.NIF

  alias Openbsd.NIF

  test "add" do
    assert 4 == NIF.add(1, 3)
  end

  test "pledge_promises" do
    IO.puts( "Testing.." )
    result = NIF.pledge_promises("")

    IO.puts( "I have result!" )

    IO.inspect(result)

    true
  end
end
