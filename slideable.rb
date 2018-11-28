require 'byebug'

module Slideable

  def horizontal_dirs
    HORIZONTALDIRS
  end

  def diagonal_dirs
    DIAGONALDIRS
  end

  def moves
    all_moves = []
    move_dirs.each do |dir|
      all_moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end
    all_moves
  end

  private

  DIAGONALDIRS = [[1, 1], [-1, -1], [1, -1], [-1, 1]]
  HORIZONTALDIRS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  def move_dirs
    raise "move_dirs not defined"
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    startpos = self.pos
    unblocked_moves = []
    x = startpos[0] + dx
    y = startpos[1] + dy
    while self.board.valid_pos?([x, y])
      unblocked_moves << [x,y]
      x += dx
      y += dy
    end
    unblocked_moves
  end

end
