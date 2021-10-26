defmodule KVStoreSupervisor do
  use Supervisor
  
  def start_link(args), do: Supervisor.start_link(__MODULE__, name: __MODULE__)
  
  def init(_args) do
    children = [
      {KVStore, [name: :"kvstore_#{Node.self}"]}
    ]
    Supervisor.init(children, strategy: :one_for_one)
  end
end