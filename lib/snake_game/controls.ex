defmodule SnakeGame.Controls do
  alias SnakeGame.GameState

  def send_command_for(?w), do: GameState.turn_snake(:up)
  def send_command_for(?s), do: GameState.turn_snake(:down)
  def send_command_for(?a), do: GameState.turn_snake(:left)
  def send_command_for(?d), do: GameState.turn_snake(:right)
  def send_command_for(?q), do: GameState.reset()
  def send_command_for(_), do: :nothing
end
