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

  #TODO (Bonus): make pretty
  def valid?(end_pos)
    path = []
    x1, y1 = @pos
    x2, y2 = end_pos
    if x1 == x2
      larger = [y1, y2].max
      smaller = [y1, y2].min
      (smaller..larger).each do |j|
        raise "Invalid Move" unless @board[[x1, j]] == NullPiece.instance
      end
    elsif y1 == y2
      larger = [x1, x2].max
      smaller = [x1, x2].min
      (smaller..larger).each do |i|
        raise "Invalid Move" unless @board[[i, y1]] == NullPiece.instance
      end
    else
      if (x1 <=> x2) == (y1 <=> y2)
        larger = [x1, x2].max
        smaller = [x1, x2].min
        smaller_y = [y1,y2].min
        y3 = -1 #maybe 1
        (smaller..larger).each do |i|
          #p [i, smaller_y + y3 + 1]
          raise "Invalid Move" unless @board[[i, smaller_y + (y3 += 1)]] == NullPiece.instance
        end
      else
          larger = [x1, x2].max
          smaller = [x1, x2].min
          larger_y = [y1,y2].max
          y3 = 1 #maybe 1
          (smaller..larger).each do |i|
            #p [i, larger_y + y3 - 1]
            raise "Invalid Move" unless @board[[i, larger_y + (y3 -= 1)]] == NullPiece.instance
          end
      end
    end
  end
end
