defmodule Openbsd.Pledge do
  @moduledoc """
  This module provides an elixir interface to the [pledge(2)](https://man.openbsd.org/pledge) system call.

  The [pledge(2)](https://man.openbsd.org/pledge) call restricts the operations a current BEAM process can perform. It is possible to crash the BEAM by restricting access to required resources.
  """
  @moduledoc since: "0.1.0"

  alias Openbsd.NIF

  @doc false
  defp to_ex(nif_response) do
    case nif_response do
      {:ok, _} -> :ok
      {:error, detail} -> {:error, detail}
      _ -> {:error, :invalid_nif_response}
    end
  end

  @doc """
  Calls pledge with both promises and execpromises.

  See [pledge(2)](https://man.openbsd.org/pledge) for both available promises and execpromises.

  ### Example: **Limiting the BEAM***
  ```elixir
  Pledge.pledge("stdio rpath wpath cpath vminfo ps error", "exec")
  ```
  """
  def pledge(promises, execpromises) do
    to_ex(NIF.pledge(promises, execpromises))
  end

  @doc """
  Calls pledge with specific promises.
  """
  def pledge_promises(promises) do
    to_ex(NIF.pledge_promises(promises))
  end

  @doc """
  Calls pledge with specific execpromises.
  """
  def pledge_execpromises(execpromises) do
    to_ex(NIF.pledge_execpromises(execpromises))
  end
end
