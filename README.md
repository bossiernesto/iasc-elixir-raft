# IascRaft

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `iasc_raft` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:iasc_raft, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/iasc_raft>.

## How to run

hay que levantar los nodos y crear un actor en cada uno...

```elixir
$ iex --sname a -S mix
iex(a@mymachine)> {:ok, _pid} = Raft.start_peer(KVStore, name: :peer1)

$ iex --sname b -S mix
iex(b@mymachine)> {:ok, _pid} = Raft.start_peer(KVStore, name: :peer2)

$ iex --sname c -S mix
iex(c@mymachine)> {:ok, _pid} = Raft.start_peer(KVStore, name: :peer3)
```

```elixir
Raft.set_configuration(:peer1,
                      [{ :peer1, :a@altair },
                      { :peer2, :b@altair },
                      { :peer3, :c@altair }]
```

elegir un lider...

```elixir
leader = Raft.leader(:peer1)
```

escribir/leer valores

```elixir 
{:ok, :foo, :bar} = KVStore.write(leader, :foo, :bar)
{:ok, :bar}       = KVStore.read(leader, :foo)
{:error, :key_not_found} = KVStore.read(leader, :baz)
```

y ahora.. matar al lider

![](./img/kill_flanders.jpg)

```elixir
Raft.stop(leader)
```

veamos que pasa si tratamos de leer algo...


```elixir
KVStore.read(leader, :foo)
{ :error, { :redirect, { :peer3, :c@altair }}}
```

veamos ahora si el nuevo lider es digno...

```elixir
new_leader = { :peer3, :c@altair }
```

```
{:ok, :bar} = KVStore.read(new_leader, :foo)
```



