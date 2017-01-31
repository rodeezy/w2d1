require_relative "piece"
require "singleton"

class NullPiece < Piece

  include Singleton

  def initialize
    @name = "_"
    @pos = [-1, -1]
    @board = nil
    @color = nil
  end

  def name
    @name
  end

  def color
    @color
  end

end
