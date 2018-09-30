defmodule RendererTest do
  alias SnakeGame.Renderer

  use ExUnit.Case
  doctest Renderer

  test "horizontal bar" do
    assert Renderer.draw_horizontal_bar("", 10) == "+----------+\n"
  end

  test "render" do
    state = %{
      board_size: 10,
      snake_direction: :up,
      snake_cells: [{1,1}, {2,2}, {3,5}, {7,10}],
      food: {4,5}
    }
    assert Renderer.render(state) ==
      "+----------+\n|#         |\n| #        |\n|          |\n|          |\n|  #O      |\n|          |\n|          |\n|          |\n|          |\n|      #   |\n+----------+\n"
  end
end
