defmodule IASCRaft.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KVStoreSupervisor
    ]

    # Start the IASC Telemetry Instrumenter
    IASC.Telemetry.Instrumenter.setup()

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: IascElixirCrdtHorde.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
