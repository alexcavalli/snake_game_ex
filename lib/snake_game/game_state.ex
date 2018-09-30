defmodule SnakeGame.GameState do
  @initial_state %{
    board_size: 20,
    snake_direction: :right,
    snake_cells: [{3, 2}, {2, 2}],
    food: {5, 5}
  }
  @valid_dirs [:up, :down, :left, :right]

  def start_link do
    Agent.start_link(fn -> @initial_state end, name: __MODULE__)
  end

  def get do
    Agent.get(__MODULE__, fn s -> s end)
  end

  def reset do
    Agent.update(__MODULE__, fn _ -> @initial_state end)
  end

  def turn_snake(dir) when dir in @valid_dirs do
    Agent.update(__MODULE__, &Map.put(&1, :snake_direction, dir))
  end

  def tick do
    Agent.update(__MODULE__, &update_snake(&1))
  end

  defp update_snake(state) do
    state
    |> update_tail_position
    |> update_head_position
  end

  # When snake head is on food, move food (and don't pop tail, thus increasing snake length)
  defp update_tail_position(state = %{board_size: board_size, food: snake_head, snake_cells: [snake_head | _rest]}) do
    x = :rand.uniform(board_size - 1) + 1
    y = :rand.uniform(board_size - 1) + 1
    Map.put(state, :food, {x, y})
  end

  # Otherwise leave food and pop tail (move the tail, snake length doesn't change)
  defp update_tail_position(state = %{snake_cells: snake_cells}) do
    snake_cells = :queue.from_list(snake_cells)
    {_, snake_cells} = :queue.out_r(snake_cells)
    snake_cells = :queue.to_list(snake_cells)
    Map.put(state, :snake_cells, snake_cells)
  end

  defp update_head_position(state = %{snake_direction: dir, snake_cells: snake_cells = [head | _rest]}) do
    snake_cells = :queue.from_list(snake_cells)
    new_head = compute_new_head(head, dir)
    snake_cells = :queue.in_r(new_head, snake_cells)
    snake_cells = :queue.to_list(snake_cells)
    Map.put(state, :snake_cells, snake_cells)
  end

  defp compute_new_head({x, y}, dir) do
    case dir do
      :up -> {x, y - 1}
      :down -> {x, y + 1}
      :right -> {x + 1, y}
      :left -> {x - 1, y}
    end
  end
end
