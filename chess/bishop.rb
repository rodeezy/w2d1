require_relative "piece"
require_relative "sliding_piece"

class Bishop < Piece
  include SlidingPiece

  def move_dirs
    [[1, 1], [1, -1]]
  end
end
