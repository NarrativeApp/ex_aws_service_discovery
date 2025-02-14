defmodule ExAws.ServiceDiscovery.MixProject do
  use Mix.Project

  @version "0.1.4"

  def project do
    [
      app: :ex_aws_service_discovery,
      version: @version,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def package do
    [
      maintainers: ["Narrative <hello@narrative.so>"],
      license: "All rights reserved",
      links: %{
        "Source" => "https://github.com/NarrativeApp/ex_aws_service_discovery"
      },
      organization: "narrativeapp"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.7", only: ~w[dev test]a, runtime: false},
      {:ex_aws, "~> 2.0"},
      {:ex_doc, ">= 0.0.0", only: ~w[dev test]a, runtime: false},
      {:git_ops, "~> 2.2", only: ~w[dev test]a, runtime: false},
      {:hackney, ">= 0.0.0", only: ~w[dev test]a},
      {:poison, ">= 0.0.0", only: ~w[dev test]a},
      {:sweet_xml, ">= 0.0.0", only: ~w[dev test]a},
      {:xml_builder, ">= 0.0.0"}
    ]
  end
end
