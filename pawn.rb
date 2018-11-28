require_relative 'piece'

class Pawn < Piece

  def symbol
    :pawn
  end

  def move_dirs
    at_start_row? ? [[2*forward_dir, 0], [1*forward_dir, 0]] : [1*forward_dir, 0]
  end

  def moves
    all_moves = []
    forward_steps.each do |dir|
      all_moves << [self.pos[0] + dir[0], self.pos[1] + dir[1]]
    end
    side_attacks.each do |dir|
      newpos = [self.pos[0] + dir[0], self.pos[1] + dir[1]]
      all_moves << newpos if opposing_piece_at_pos?(newpos)
    end
    all_moves
  end

  private

  def at_start_row?
    if self.color == :black
      self.pos[0] == 1 ? true : false
    else
      self.pos[0] == 6 ? true : false
    end
  end

  def forward_dir
    self.color == :white ? -1 : 1
  end

  def forward_steps
    at_start_row? ? [[2*forward_dir, 0], [1*forward_dir, 0]] : [[1*forward_dir, 0]]
  end

  def side_attacks
    [[1*forward_dir, -1], [1*forward_dir, 1]]
  end

end
