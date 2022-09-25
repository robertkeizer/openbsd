defmodule Openbsd.NIF do
  use Rustler, otp_app: :openbsd, crate: "openbsd_nif"
  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
  def pledge_promises(_s), do: :erlang.nif_error(:nif_not_loaded)
  def pledge_execpromises(_s), do: :erlang.nif_error(:nif_not_loaded)
  def pledge(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
