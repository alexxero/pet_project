defmodule PetProject.MixProject do
  use Mix.Project

  def project do
    [
      app: :pet_project,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {PetProject.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "~> 1.7.11"},
      {:phoenix_ecto, "~> 4.4"},
      {:jason, "~> 1.2"},

      # OpenAI
      {:req, "~> 0.4.0"},

      # FlanT5
      {:bumblebee, "~> 0.5"},
      {:exla, ">= 0.0.0"}
    ]
  end
end
