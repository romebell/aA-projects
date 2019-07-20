class Deck
  

  def initialize
    @stack = Array.new(52) { Array.new } # assume there are 52 cards in stack and instance of card class
  end

  def deal_cards(player1=[], player2=[])
    # assume two players
    5.times do
      player1 << stack.pop
      player2 << stack.pop
    end
  end

  def stack_length
    @stack.length
  end

  def stack_type
    @stack
  end 

  def add_discarded_card(cards=[])
    # assume cards are dealt
  end

  

  def shuffle_cards
  
  end

  # private
  # attr_reader :stack
end

if __FILE__ == $PROGRAM_NAME
  deck = Deck.new
  p deck.stack_length
end