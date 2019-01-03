require_relative 'pieces'

class Piece
  attr_reader :color, :pos
  attr_accessor :board

  WSYMBOLS = {:queen => "♕ ", :rook => "♖ ", :pawn => "♙ ", :bishop => "♗ ",
  :knight =>"♘ " , :king => "♔ ", :null => "   "}

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

  def move_into_check?(end_pos)
    board_dup = self.board.dup
    board_dup.move_piece!(self.pos, end_pos)
    board_dup.in_check?(self.color)
  end

  private

  def opposing_piece_at_pos?(pos)
    return false unless pos[0].between?(0, 7) && pos[1].between?(0, 7)
    self.color == :white ? self.board[pos].color == :black : self.board[pos].color == :white
  end

end
