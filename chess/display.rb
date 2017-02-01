require "colorize"
require_relative "cursor"
require_relative "board"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  #TODO (Bonus (credit to neighbors) ): unicode pieces, blinking, grey squares

  def render_board
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if @cursor.cursor_pos == [i, j]
          if @cursor.selected
            #piece.toggle_select
            print piece.to_s.colorize(:color => :red, :background => :black)
          else
            print piece.to_s.colorize(:color => :green, :background => :black)
          end
        else
          print piece
        end
      end
       puts
    end
  end

  def render_loop
    while true
      system("clear")
      render_board
      @cursor.get_input
    end
  end

end
