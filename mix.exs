defmodule ExW3.MixProject do
  use Mix.Project

  @source_url "https://github.com/samparmenter/exw3"
  @version "0.6.2"

  def project do
    [
      app: :exw3,
      version: @version,
      elixir: "~> 1.12",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: @source_url,
      docs: docs(),
      package: package(),
      dialyzer: [
        remove_defaults: [:unknown]
      ],
      preferred_cli_env: [
        docs: :docs,
        "hex.publish": :docs
      ]
    ]
  end

  def application do
    [applications: [:logger, :ex_abi, :ethereumex]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:ethereumex, "~> 0.9"},
      {:ex_keccak, "~> 0.4.0"},
      {:ex_abi, "~> 0.5.11"},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:jason, "~> 1.2"}
    ]
  end

  defp package do
    [
      name: "exw3",
      description: "A high level Ethereum JSON RPC Client for Elixir",
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Harley Swick"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "readme", # The main page in the docs
      logo: "assets/ex3w_logo.jpg",
      extras: [
        LICENSE: [title: "License"],
        "README.md": [title: "Overview"]
      ],
      source_url: @source_url,
      source_ref: "v#{@version}",
      formatters: ["html"]
    ]
  end
end
