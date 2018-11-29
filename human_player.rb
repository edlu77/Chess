require_relative 'piece'
require_relative 'player'

class HumanPlayer < Player

  def make_move(_board)
    move_made = false
    until move_made
      system("clear")
      self.display.render
      self.display.cursor.get_input
      if self.display.cursor.selected
        startpos = self.display.cursor.cursor_pos
        # p startpos
        # p self.display.board[startpos].valid_moves
        while self.display.cursor.selected
          system("clear")
          self.display.render
          self.display.cursor.get_input
          endpos = self.display.cursor.cursor_pos
        end
        self.display.board.move_piece(startpos, endpos)
        move_made = true
      end
    end
  end
end
