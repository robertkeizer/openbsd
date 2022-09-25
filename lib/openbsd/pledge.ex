defmodule Openbsd.Pledge do
  alias Openbsd.NIF

  def pledge(promises, execpromises) do
    case NIF.pledge(promises, execpromises) do
      {:ok, _} -> :ok
      {:error, detail} -> {:error, detail}
      _ -> {:error, :invalid_nif_response}
    end
  end
end
