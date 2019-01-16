require "colorize"
require_relative "cursor"
require_relative "board"

class Display
  
  attr_reader :board, :cursor, :cursor_pos
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @cursor_pos = [0,0]
  end

  def get_cursor_pos
    cursor_pos
  end
  
  def render

    puts "========================================="

    (0..7).each do |row|
      (0..7).each do |col|
        pos = [row, col]
        piece = @board[pos].color

        
        case piece
        when :black
          if @cursor_pos == pos
            print "| ♟  ".colorize(:color => :blue, :background => :yellow)
          else
            print "| ♟  ".colorize(:blue)
          end

        when :white
          print "| ♟  ".colorize(:red)
        else
          print "|    "
        end
        if col == 7
          puts "|"
        end
      end
      puts "========================================="
    end
    

    puts "move cursor to select piece to move"
    new_pos = cursor.get_input

    @cursor_pos = new_pos
    render
  end
end

if $PROGRAM_NAME == __FILE__
  b = Board.new
  d = Display.new(b)
  d.render
end