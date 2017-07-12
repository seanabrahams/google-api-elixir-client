defmodule Google.Mixfile do
  use Mix.Project

  def project do
    [app: :google_api_client,
     version: "1.0.0",
     description: "Google API Client for Elixir",
     package: package(),
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     elixirc_paths: elixirc_paths(Mix.env),
     preferred_cli_env: [
       vcr: :test, "vcr.delete": :test, "vcr.check": :test, "vcr.show": :test
     ],
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
    [
      {:httpoison, "~> 0.8"},
      {:poison, "~> 1.5 or ~> 2.0 or ~> 3.0"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:exvcr, "~> 0.8", only: :test},
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      maintainers: ["Sean Abrahams"],
      licenses: ["BSD"],
      links: %{"GitHub" => "https://github.com/seanabrahams/google-api-elixir-client"},
    ]
  end
end
