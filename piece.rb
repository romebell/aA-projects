require "singleton"

class Piece
  attr_reader :color

  def initialize(color)
    @color = color
    # @symbol = symbol
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
  end

  def color
    :none
  end

end

class Pawn < Piece
  def initialize(color)
    super(color)
  end
end

# class Queen < Piece

# end

# class King < Piece

# end

# class Rook < Piece

# end

# class Knight < Piece
#   def initialize(color, symbol)
#     super(color, symbol)
#   end
# end

# class Bishop < Piece
#   def initialize(color, symbol)
#     super(color, symbol)
#   end
# end


# Farm 
# require 'singleton'

# module MyEnumerable
#   def map(&prc)
#     result = []
#     self.each { |el| result << prc.call(el) }
#     result
#   end
# end

# class Farm
#   include Enumerable
#   extend Enumerable
#   def initialize(animals)
#     @animals = animals
#   end

#   def each(&prc)
#     @animals.each(&prc)
#   end

#   def self.each # Farm::each 
#     yield 1
#     yield 2
#     yield 3
#   end
# end

# class Animal
#   attr_reader :name

#   def initialize(name, pos)
#     @name = name 
#     @pos = pos
#   end

#   def move(distance)
#     new_pos = @pos + distance
#     puts "#{@name} #{movement} from #{@pos} to #{new_pos}."
#     @pos = new_pos
#   end

#   def make_noise
#     puts "#{@name} #{noise}."
#   end

#   private

#   def quietly
#     print "Quietly, "
#   end
# end

# class NullAnimal < Animal
#   include Singleton

#   def initialize
#   end

#   def move(_distance)
#     puts "tumble weed blows through."
#   end

#   def make_noise
#     puts "chirp chirp."
#   end
# end

# class BrokenLegError < StandardError; end

# class Horse < Animal
#   def movement
#     raise BrokenLegError if leg_broken?
#     "gallops"
#   end

#   def leg_broken?
#     @leg_broken
#   end

#   def noise
#     self.quietly
#     "neighs"
#   end

#   def break_leg
#     @leg_broken = true
#     puts "oh noooooo #{@name} broke a leg. Neiiiigh"
#   end

#   def heal_leg
#     @leg_broken = false
#     puts "y-eiiiiigh it's healed!"
#   end
# end

# class Pig < Animal
#   def movement
#     "trots"    
#   end

#   def noise
#     "oink"
#   end
# end




# end