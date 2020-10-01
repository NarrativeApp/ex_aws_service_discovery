defmodule ExAws.ServiceDiscovery.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_aws_service_discovery,
      version: "0.1.2",
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
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:hackney, ">= 0.0.0", only: [:dev, :test]},
      {:sweet_xml, ">= 0.0.0", only: [:dev, :test]},
      {:poison, ">= 0.0.0", only: [:dev, :test]},
      {:xml_builder, ">= 0.0.0"},
      {:ex_aws, "~> 2.0"}
    ]
  end
end
