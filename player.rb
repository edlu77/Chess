require_relative 'human_player'
require_relative 'display'

class Player
  attr_reader :color, :display

  def initialize(color, display)
    @color = color
    @display = display
  end
end
