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
      {:raft, git: "https://github.com/bossiernesto/raft.git", tag: "v0.2.2"},
      {:libcluster, "~> 3.3"}
    ]
  end
end
