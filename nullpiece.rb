require 'singleton'

class Nullpiece < Piece
  include Singleton

  def initialize
  end

  def moves
  end

  def symbol
    :null
  end
end
