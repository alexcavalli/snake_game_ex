defmodule SnakeGame.ScreenWriter do

  # Additional magic stolen from https://github.com/fhunleth/snake/blob/master/lib/snake/ui.ex
  def draw(%{window: window}, screen) do
    ExNCurses.clear()
    ExNcurses.wclear(window)
    ExNcurses.wborder(window)
    ExNcurses.mvaddstr(0, 0, screen)
    ExNcurses.waddstr(window, screen)
    ExNcurses.refresh()
    ExNcurses.wrefresh(window)
  end

end
