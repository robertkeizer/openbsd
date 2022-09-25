defmodule Openbsd.MixProject do
  use Mix.Project

  def project do
    [
      app: :openbsd,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "OpenBSD",
      source_url: "https://github.com/robertkeizer/openbsd",
      docs: [
        main: "Openbsd",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:rustler, "~> 0.26.0"},
      {:ex_doc, "~> 0.28.5", only: :dev, runtime: false}
    ]
  end
end
