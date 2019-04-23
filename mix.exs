defmodule Hubspot.Mixfile do
  use Mix.Project

  def project do
    [app: :hubspotex,
     version: "0.0.6",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:httpoison, "~> 1.0"},
     {:poison, "~> 2.0"},
     {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    """
    Hubspot API wrapper
    """
  end

  defp package do
    [# These are the default files included in the package
     maintainers: ["Ryan Winchester"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/ryanwinchester/hubspotex"}]
  end
end
