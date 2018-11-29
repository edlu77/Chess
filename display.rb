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
end
