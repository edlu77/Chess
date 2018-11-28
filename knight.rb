require_relative 'stepable'
require_relative 'piece'

class Knight < Piece
  include Stepable

  def symbol
    :knight
  end

  protected

  def move_diffs
    knight_diffs
  end
end
