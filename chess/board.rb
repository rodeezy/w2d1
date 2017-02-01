require_relative "piece"
require_relative "null_piece"
require_relative "rook"
require_relative "pawn"
require_relative "knight"
require_relative "queen"
require_relative "bishop"
require_relative "king"

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
    @grid[1].each_index { |j| @grid[1][j] = Pawn.new('P', self, [1,j], :black ) }

    @grid[6].each_index { |j| @grid[6][j] = Pawn.new('P', self, [6,j], :white ) }

    @grid[0].each_index do |i|
      if i == 0 || i == 7
        @grid[0][i] = Rook.new("R", self, [0, i], :black)
      elsif i == 1 || i == 6
        @grid[0][i] = Knight.new("N", self, [0, i], :black)
      elsif i == 2 || i == 5
        @grid[0][i] = Bishop.new("B", self, [0, i], :black)
      elsif i == 3
        @grid[0][i] = Queen.new("Q", self, [0, i], :black)
      elsif i == 4
        @grid[0][i] = King.new("K", self, [0, i], :black)
      end
    end

    @grid[7].each_index do |i|
      if i == 0 || i == 7
        @grid[7][i] = Rook.new("R", self, [7, i], :white)
      elsif i == 1 || i == 6
        @grid[7][i] = Knight.new("N", self, [7, i], :white)
      elsif i == 2 || i == 5
        @grid[7][i] = Bishop.new("B", self, [7, i], :white)
      elsif i == 3
        @grid[7][i] = Queen.new("Q", self, [7, i], :white)
      elsif i == 4
        @grid[7][i] = King.new("K", self, [7, i], :white)
      end
    end
    # @grid[6].each_with_index do |row, i|
    #   row.each_index { |j| row[j] = Pawn.new('P', self, [i, j], :white) }
    # end

  end

  def map_row(piece)

  end

end
