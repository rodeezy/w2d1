require 'colorize'
class Piece
  attr_reader :name
  def initialize(name, board, pos, color)
    @name = name
    @board = board
    @pos = pos
    @color = color
    @selected = false
  end

  def to_s
    #figure out making it a square
    "#{@name} ".colorize(:color => color, :background => :yellow)
  end

  def color
    @selected ? :red : @color
  end

  def moves

  end

  def toggle_select
    @selected = !@selected
  end

end
