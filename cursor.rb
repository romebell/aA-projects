require "io/console"
require_relative "display"

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

  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
  end

  def get_input
    key = KEYMAP[read_char] # if we press 'l', key = :right
    handle_key(key) # call handle
  end

  # we added this method
  # def get_cursor_pos
  #   display.get_cursor_pos
  # end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                 # at most maxlen bytes from a
                                                 # data stream; it's nonblocking,
                                                 # meaning the method executes
                                                 # asynchronously; it raises an
                                                 # error if no data is available,
                                                 # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    one_move_arr = MOVES[key] # => [0, 1]
    value = update_pos(one_move_arr)
    return value
  end

  def update_pos(diff)
    cursor = display.get_cursor_pos
    pos_one = cursor[0] + diff[0]
    pos_two = cursor[1] + diff[1]
    new_pos = [pos_one, pos_two]
    new_pos
  end
end

