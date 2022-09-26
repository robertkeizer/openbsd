# OpenBSD

This package allows exposes functionality specific to [OpenBSD](https://www.openbsd.org/).

It is ***not*** an official project of the [OpenBSD Foundation](https://www.openbsdfoundation.org/).

The following system calls are supported:
 - [pledge(2)](https://man.openbsd.org/pledge.2) via `Openbsd.Pledge`

## Installation

The package can be installed by adding `openbsd` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:openbsd, "~> 0.1.0"}
  ]
end
```

## Internals

The package makes use of [rustler](https://github.com/rusterlium/rustler) and the [openbsd](https://crates.io/crates/openbsd) crate.
