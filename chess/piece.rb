class Piece
  attr_reader :name
  def initialize(name, board, pos, color)
    @name = name
    @board = board
    @pos = pos
    @color = color
  end

  def to_s
    #figure out making it a square
    @name + " "
  end

  def color
    @color
  end

  def moves

  end

end
