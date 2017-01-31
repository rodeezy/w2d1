require_relative "piece"
require_relative "sliding_piece"

class Queen < Piece
  include SlidingPiece

  def move_dirs
    [[0,1],[1,0],[1,1],[1, -1]]
  end
end
