# SnakeGame

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `snake_game` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:snake_game, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/snake_game](https://hexdocs.pm/snake_game).




queso plan

Components:

Thing that draws to the screen
Thing that converts game state to screen data
Thing that accepts input
Thing that holds game state
A timer?


Flow:
Start:
Pre-step, present info on keys, press some button to start, maybe configure settings.
Then
Draw board with snake and food
Accept keystrokes for changing direction
Start timer

Then handle events
Timer -> increment game state and redraw board
Keystrokes -> alter game state


