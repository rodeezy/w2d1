module SlidingPiece
  def moves
    result = []
    x, y = @pos
    move_dirs.each do |delta|
      (-7..7).each do |i|
        x2, y2 = delta.map { |el| el * i}
        result << [x + x2, y + y2]
      end
    end
    result.reject { |el| el == @pos}
  end
end
