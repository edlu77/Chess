require_relative 'stepable'
require_relative 'piece'

class King < Piece
  include Stepable

  def symbol
    :king
  end

  protected

  def move_diffs
    king_diffs
  end
end
