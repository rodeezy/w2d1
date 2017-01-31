require_relative "piece"
require_relative "sliding_piece"

class Rook < Piece
  include SlidingPiece

  def move_dirs
    [[0,1],[1,0]]
  end
end
