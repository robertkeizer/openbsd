defmodule Openbsd.Pledge do
  @moduledoc """
  This module provides an interface to the [pledge(2)](https://man.openbsd.org/pledge) system call.

  [pledge(2)](https://man.openbsd.org/pledge) restricts operations the current operating system process (the BEAM) can perform. It is possible to crash the BEAM by restricting access to required resources.
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
  Calls pledge with both `promises` and `execpromises`.

  ```elixir
  :ok = pledge("stdio rpath wpath cpath vminfo ps error", "exec")
  ```

  ```elixir
  {:error, :einval} = pledge("invalid_promise", "exec")
  ```
  """
  @spec pledge(String.t(), String.t()) :: any
  def pledge(promises, execpromises) do
    to_ex(NIF.pledge(promises, execpromises))
  end

  @doc """
  Calls pledge with specific `promises`.
  """
  def pledge_promises(promises) do
    to_ex(NIF.pledge_promises(promises))
  end

  @doc """
  Calls pledge with specific `execpromises`.
  """
  def pledge_execpromises(execpromises) do
    to_ex(NIF.pledge_execpromises(execpromises))
  end
end
