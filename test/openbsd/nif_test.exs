defmodule OpenbsdTest.NIF do
  use ExUnit.Case
  doctest Openbsd.NIF

  alias Openbsd.NIF

  test "add" do
    assert 4 == NIF.add(1, 3)
  end

  describe "pledge_promises" do
    test "Returns {:error, :einval} for invalid input" do
      assert {:error, :einval} = NIF.pledge_promises("invalid_input")
    end

    test "Returns {:ok, :ok} for valid input" do
      assert {:ok, :ok} = NIF.pledge_promises("stdio rpath wpath cpath vminfo ps error")
    end
  end
end
