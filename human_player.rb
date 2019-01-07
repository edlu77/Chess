require_relative 'player'

class HumanPlayer < Player

  def make_move(_board)
    move_made = false
    until move_made
      self.display.render
      self.display.cursor.get_input
      system("clear")
      puts "#{self.color}'s move"
      if self.display.cursor.selected
        startpos = self.display.cursor.cursor_pos
        raise "incorrect color" if self.color != self.display.board[startpos].color
        while self.display.cursor.selected
          endpos = get_second_pos
        end
        self.display.board.move_piece(startpos, endpos)
        move_made = true
      end
    end
  end

  def get_second_pos
    system("clear")
    puts "#{self.color}'s move"
    self.display.render
    self.display.cursor.get_input
    self.display.cursor.cursor_pos
  end
end
