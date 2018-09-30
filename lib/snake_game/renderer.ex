defmodule SnakeGame.Renderer do

  # game_state = %{
  #   board_size: 10,
  #   snake_direction: :up,
  #   snake_cells: [{x, y}, {x, y}] # first one is head?
  #   food: {x,y}
  # }

  def render(game_state = %{board_size: board_width}) do
    ""
    |> draw_horizontal_bar(board_width)
    |> draw_board_rows(game_state)
    |> draw_horizontal_bar(board_width)
  end

  def draw_horizontal_bar(current_render, board_width) do
    current_render <>
      "+" <>
      (Enum.map(1..board_width, fn _ -> "-" end) |> Enum.join) <>
      "+" <>
      "\n"
  end

  def draw_board_rows(current_render, game_state = %{board_size: board_height}) do
    current_render <> (
      (1..board_height)
      |> Enum.map(fn y -> draw_board_row(y, game_state) end)
      |> Enum.join
    )
  end

  def draw_board_row(y, game_state = %{board_size: board_width}) do
    "|" <> (
      (1..board_width)
      |> Enum.map(fn x -> draw_board_cell({x, y}, game_state) end)
      |> Enum.join
    ) <>
    "|" <>
    "\n"
  end

  def draw_board_cell(cell, game_state) do
    cond do
      snake_cell?(cell, game_state) -> "#"
      food_cell?(cell, game_state) -> "O"
      true -> " "
    end
  end

  def snake_cell?(cell, %{snake_cells: snake_cells}) do
    Enum.member?(snake_cells, cell)
  end

  def food_cell?(cell, %{food: cell}), do: true
  def food_cell?(_, _), do: false

end
