defmodule SnakeGame.GameRules do
  alias SnakeGame.GameState

  def valid_game_state?(state) do
    !wall_collision?(state) && !snake_collision?(state)
  end

  defp wall_collision?(%{snake_cells: [{x, _} | _]}) when x < 1, do: true
  defp wall_collision?(%{snake_cells: [{_, y} | _]}) when y < 1, do: true
  defp wall_collision?(%{board_size: board_size, snake_cells: [{x, _} | _]}) when x > board_size, do: true
  defp wall_collision?(%{board_size: board_size, snake_cells: [{_, y} | _]}) when y > board_size, do: true
  defp wall_collision?(_), do: false

  defp snake_collision?(%{snake_cells: snake_cells}) do
    (snake_cells |> Enum.uniq |> Enum.count) != (snake_cells |> Enum.count)
  end

end
