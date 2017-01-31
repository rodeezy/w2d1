module SteppingPiece
  def moves
    result = []
    x, y = @pos
    move_dirs.each do |delta|
      result << [x + delta[0], y + delta[1]]
    end
    result
  end
end
