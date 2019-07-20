require_relative 'piece'
class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
    populate_board
  end

  def [](pos)
    row, col = pos 
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def color
    color
  end

  def populate_board
    (0..7).each do |row|
      (0..7).each do |col|
        
        if row == 1 || row == 0
          @board[row][col] = Piece.new(:black)
        end
        
        if row >= 2 && row <= 5
          @board[row][col] = NullPiece.instance
        end

        if row == 6 || row == 7
          @board[row][col] = Piece.new(:white)
        end

      end
    end
    
  end

  

  def move_piece(start_pos, end_pos)
    start_pos = @board[start_pos[0]][start_pos[1]]
    end_pos = @board[end_pos[0]][end_pos[1]]
   
    raise "Not on board" if start_pos.nil? || end_pos.nil?
    raise "No piece here" if start_pos.color == :none
    raise "Space occupied" if end_pos.color == :white || end_pos.color == :black
    
    start_pos, end_pos = end_pos, start_pos
    p start_pos
    p end_pos
  end

end

#  b.move_piece([1,0], [2,0])