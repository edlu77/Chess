require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_accessor :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    puts "  A B C D E F G H"
    [8,7,6,5,4,3,2,1].each_with_index do |el, idx|
      row = "#{el} "
      (0..7).each do |j|
        if self.cursor.cursor_pos == [idx, j]
          row += board[[idx,j]].to_s.colorize(
            :background => self.cursor.selected ? :red : :green
          )
        else
          row += board[[idx,j]].to_s.colorize(
            :background => (idx+j)%2 == 0 ? :gray : :white
          )
        end
      end
      puts row
    end
  end
end
