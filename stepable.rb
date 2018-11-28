module Stepable

  def knight_diffs
    KNIGHT_DIFFS
  end

  def king_diffs
    KING_DIFFS
  end

  def moves
    all_moves = []
    move_diffs.each do |dir|
      newpos = [self.pos[0] + dir[0], self.pos[1] + dir[1]]
      all_moves << newpos if self.board.valid_pos?(newpos)
    end
    all_moves
  end

  private

  KNIGHT_DIFFS = [[1, 2], [2, 1], [-1, -2], [-2, -1], [-1, 2], [2, -1], [1, -2], [-2, 1]]
  KING_DIFFS = [[1, 1], [-1, -1], [1, -1], [-1, 1], [1, 0], [0, 1], [-1, 0], [0, -1]]

  def move_diffs
    raise "move_diffs not defined"
  end
end
