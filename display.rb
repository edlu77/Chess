require 'colorize'
require_relative 'pieces'
require_relative 'piece'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_accessor :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    (0..7).each do |i|
      row = ""
      (0..7).each do |j|
        if self.cursor.cursor_pos == [i, j]
          row += board[[i,j]].to_s.colorize(
            :background => self.cursor.selected ? :red : :green
          )
        else
          row += board[[i,j]].to_s
        end
      end
      puts row
    end
  end

  def make_move
    while true
      system("clear")
      render
      self.cursor.get_input
      if self.cursor.selected
        startpos = self.cursor.cursor_pos
        while self.cursor.selected
          system("clear")
          render
          self.cursor.get_input
          endpos = self.cursor.cursor_pos
        end
        self.board.move_piece(startpos, endpos)
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  d.make_move

end
