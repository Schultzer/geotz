defmodule Geotz.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :geotz,
      version: @version,
      elixir: "~> 1.5",
      name: "Geotz",
      source_url: "https://github.com/schultzer/geotz",
      description: description(),
      package: package(),
      docs: docs(),
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  defp description do
    """
    Geotz provides functions for fast timezone lookup for a given latitude and longtitude
    """
  end


  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:decimal, "~> 1.4", optional: true},
      {:ex_doc, ">= 0.18.1", only: :dev},
    ]
  end

  defp package do
    [
      maintainers: ["Benjamin Schultzer"],
      licenses: ["MIT"],
      links: links(),
      files: [
        "lib", "config", "mix.exs", "README*", "CHANGELOG*", "LICENSE*"
      ]
    ]
  end

  def docs do
    [
      source_ref: "v#{@version}",
      main: "readme",
      extras: ["README.md", "CHANGELOG.md"]
    ]
  end

  def links do
    %{
      "GitHub"    => "https://github.com/schultzer/geotz",
      "Readme"    => "https://github.com/schultzer/geotz/blob/v#{@version}/README.md",
      "Changelog" => "https://github.com/schultzer/geotz/blob/v#{@version}/CHANGELOG.md"
    }
  end

end
