require_relative "piece"

class Pawn < Piece
  def move_dirs
    [
      [1, 0],
      [2, 0],
      [1, 1],
      [1, -1]
    ]
  end

#multiply by -1 for white pieces
#[1,0] moves down 1

  def moves(player)
    #TODO Change player_coef based on player turn
    result = []
    x, y = @pos
    player_coef = player == "black" ? 1 : -1
    move_dirs.each do |delta|
      result << [x + delta[0] * player_coef, y + delta[1]]
    end
    result
  end


  def valid?

  end

end
