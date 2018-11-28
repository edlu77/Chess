require "io/console"
require "byebug"

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor
  attr_accessor :cursor_pos, :board, :selected

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @selected = false
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  def toggle_selected
    self.selected = self.selected ? false : true
  end

  private

  def read_char
    STDIN.echo = false
    STDIN.raw!
    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
    STDIN.echo = true
    STDIN.cooked!
    return input
  end

  def handle_key(key)
    case key
    when :return, :space
      toggle_selected
      self.cursor_pos
    when :up, :down, :left, :right
      update_pos(MOVES[key])
    when :ctrl_c
      Process.exit(0)
    end
  end

  def update_pos(diff)
    newpos = [self.cursor_pos[0] + diff[0], self.cursor_pos[1] + diff[1]]
    self.cursor_pos = newpos if newpos[0].between?(0, 7) && newpos[1].between?(0, 7)
  end
end
