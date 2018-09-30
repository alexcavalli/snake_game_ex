defmodule SnakeGame.InputHandler do
  alias SnakeGame.Controls

  def start_link do
    Task.start_link(fn -> start() end)
  end

  # Lots of code copied from
  # http://elixirsips.com/episodes/062_quickie_synth.html
  def start do
    create_window(100, 200)
    |> read_loop()
  end

  def create_window(width, height) do
    gs_server = :gs.start()
    :gs.create(:window, gs_server, [width: width, height: height, keypress: true, map: true])
  end

  def read_loop(window) do
    receive do
      {:gs, ^window, :keypress, _data, args} ->
        key = hd(args)
        Controls.send_command_for(key)
    end
    read_loop(window)
  end

end
