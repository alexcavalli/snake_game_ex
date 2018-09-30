defmodule SnakeGame.InputHandler do
  alias SnakeGame.Controls

  def start_link do
    Task.start_link(fn -> start() end)
  end

  # Lots of control-handling (ExNCurses) code copied from
  # https://github.com/fhunleth/snake/blob/master/lib/snake/ui.ex
  def start do
    create_window(100, 200)
    |> read_loop()
  end

  def create_window(width, height) do
    ExNcurses.initscr()

    win = ExNcurses.newwin(height - 1, width, 1, 0)
    ExNcurses.listen()
    ExNcurses.noecho()
    ExNcurses.keypad()
    ExNcurses.curs_set(0)

    GameState.add_window(win)

    win
  end

  def read_loop(window) do
    receive do
      {:ex_ncurses, :key, key} ->
        Controls.send_command_for(key)
    end
    read_loop(window)
  end

end
