defmodule IascRaft.MixProject do
  use Mix.Project

  def project do
    [
      app: :iasc_raft,
      version: "0.1.0",
      elixir: "~> 1.13-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:raft, "~> 0.2.1"},
      {:swoosh, "~> 1.3"},
      {:telemetry, "~> 1.0"},
      {:libcluster, "~> 3.3"},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
