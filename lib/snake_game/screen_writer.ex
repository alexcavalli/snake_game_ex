defmodule SnakeGame.ScreenWriter do

  def draw(screen) do
    IO.write(IO.ANSI.clear())
    IO.write(screen)
  end

end
