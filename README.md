# openbsd

This is an [elixir](https://elixir-lang.org/) [NIF](https://www.erlang.org/doc/tutorial/nif.html) that exposes [pledge(2)](https://man.openbsd.org/pledge.2) functionality (by way of [rustler](https://github.com/rusterlium/rustler) and [the openbsd crate](https://crates.io/crates/openbsd)) when running elixir on [OpenBSD](https://www.openbsd.org/).

## Usage

 * `pledge_promises/1`
 * `pledge_execpromises/1`
 * `pledge/2`

```elixir
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `openbsd` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:openbsd, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/openbsd](https://hexdocs.pm/openbsd).

