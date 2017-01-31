require_relative "piece"
require_relative "null_piece"

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    setup
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].class == NullPiece
      puts "no piece to move"
    else
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []= (pos, new_piece)
    x, y = pos
    @grid[x][y] = new_piece
  end

  def insert_piece(pos, piece)
    self[pos] = piece
  end

  def setup
    # setup_pieces((0..1))
    # setup_pieces((6..7))
    @grid[2..5].each_with_index do |row, i|
      row.each_index { |j| row[j] = NullPiece.instance }
    end
    @grid[0..1].each_with_index do |row, i|
      row.each_index { |j| row[j] = Piece.new('P', [i, j], self ) }
    end
    @grid[6..7].each_with_index do |row, i|
      row.each_index { |j| row[j] = Piece.new('P', [i, j], self) }
    end

  end

  def map_row(piece)

  end

end
