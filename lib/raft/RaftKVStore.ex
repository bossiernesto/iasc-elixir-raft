defmodule KVStore do
  use Raft.StateMachine

  @initial_state %{}

  def write(name, key, value) do
    Raft.write(name, {:set, key, value})
  end

  def read(name, key) do
    Raft.read(name, {:get, key})
  end

  def init(_name) do
    @initial_state
  end

  def handle_write({:set, key, value}, state) do
    {{:ok, key, value}, put_in(state, [key], value)}
  end

  def handle_read({:get, key}, state) do
    case get_in(state, [key]) do
      nil ->
        {{:error, :key_not_found}, state}

      value ->
        {{:ok, value}, state}
    end
  end
end