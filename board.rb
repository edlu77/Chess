require_relative 'piece'
require 'byebug'

class Board
  attr_accessor :grid

  def initialize
    @null = Nullpiece.instance
    @grid = Array.new(8) {Array.new(8, @null)}
    populate_board
  end

  def [](pos)
    x, y = pos
    self.grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    self.grid[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    raise "no piece at starting position" if self[start_pos].empty?
    raise "invalid end position" unless valid_pos?(end_pos)
    raise "invalid move" unless self[start_pos].moves.include?(end_pos)
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    self[end_pos].pos, self[start_pos].pos = end_pos, start_pos
  end

  def valid_pos?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7) && self[pos].empty?
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end

  private

  def populate_rooks
    [0, 7].each do |i|
      color = i == 0 ? :black : :white
      [0, 7].each do |j|
        add_piece(Rook.new(color, self, [i, j]), [i, j])
      end
    end
  end

  def populate_bishops
    [0, 7].each do |i|
      color = i == 0 ? :black : :white
      [2, 5].each do |j|
        add_piece(Bishop.new(color, self, [i, j]), [i, j])
      end
    end
  end

  def populate_queens
    [0, 7].each do |i|
      color = i == 0 ? :black : :white
      add_piece(Queen.new(color, self, [i, 3]), [i, 3])
    end
  end

  def populate_knights
    [0, 7].each do |i|
      color = i == 0 ? :black : :white
      [1, 6].each do |j|
        add_piece(Knight.new(color, self, [i, j]), [i, j])
      end
    end
  end

  def populate_kings
    [0, 7].each do |i|
      color = i == 0 ? :black : :white
      add_piece(King.new(color, self, [i, 4]), [i, 4])
    end
  end

  def populate_pawns
    [1, 6].each do |i|
      color = i == 1 ? :black : :white
      (0..7).each do |j|
        add_piece(Pawn.new(color, self, [i, j]), [i, j])
      end
    end
  end

  def populate_board
    populate_rooks
    populate_bishops
    populate_queens
    populate_knights
    populate_kings
    populate_pawns
  end

end
