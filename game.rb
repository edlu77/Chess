require_relative 'display'
require_relative 'board'
require_relative 'human_player'

class Game
  attr_accessor :board, :display, :players, :current_player

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      w: HumanPlayer.new(:white, @display),
      b: HumanPlayer.new(:black, @display)
    }
    @current_player = @players[:w]
  end

  def play
    until self.board.checkmate?(:white) || self.board.checkmate?(:black)
      puts self.current_player.color
      self.current_player.make_move(self.board)
      swap_turn!
    end
    notify_players
  end

  private

  def notify_players
    p "checkmate!"
  end

  def swap_turn!
    @current_player = @current_player == self.players[:w] ? self.players[:b] : self.players[:w]
  end

end

if __FILE__ == $PROGRAM_NAME
  g = Game.new
  # g.board.move_piece([6,5],[5,5])
  # g.board.move_piece([1,4],[3,4])
  # g.board.move_piece([6,6],[4,6])
  # g.board.move_piece([0,3],[4,7])
  g.play
end
