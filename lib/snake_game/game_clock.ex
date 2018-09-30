defmodule SnakeGame.GameClock do
  alias SnakeGame.{GameState, Renderer, ScreenWriter, GameRules}

  def start_link(tick_ms \\ 250) do
    Task.start_link(fn -> start(tick_ms) end)
  end

  def start(tick_ms) do
    redraw_board()
    loop(tick_ms)
  end

  defp loop(tick_ms) do
    :timer.sleep(tick_ms)
    GameState.tick()
    unless GameRules.valid_game_state?(GameState.get()) do
      GameState.reset()
    end
    redraw_board()
    loop(tick_ms)
  end

  defp redraw_board do
    GameState.get()
    |> Renderer.render()
    |> ScreenWriter.draw()
  end
end
