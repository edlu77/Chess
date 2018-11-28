require_relative 'pieces'
require 'byebug'

class Piece
  attr_reader :color, :board, :pos

  WSYMBOLS = {:queen => "♕ ", :rook => "♖ ", :pawn => "♙ ", :bishop => "♗ ",
  :knight =>"♘ " , :king => "♔ ", :null => "  "}

  BSYMBOLS = {:queen => "♛ ", :rook => "♜ ", :pawn => "♟ ", :bishop => "♝ ",
  :knight => "♞ ", :king => "♚ ", :null => "  "}

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    self.color == :white ? WSYMBOLS[self.symbol] : BSYMBOLS[self.symbol]
  end

  def empty?
    self.class == Nullpiece
  end

  def valid_moves
    moves.reject{|move| move_into_check?(move)}
  end

  def pos=(val)
    @pos = val
  end

  def symbol
  end

  private

  def move_into_check?(end_pos)
    board_dup = self.board.dup
    board_dup.move_piece(self.pos, end_pos)
    board_dup.in_check?(self.color)
  end

end
