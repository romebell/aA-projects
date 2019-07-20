require 'rspec'
require 'deck'

RSpec.describe do 
  subject(:d) { Deck.new }
  let(:player1) { Array.new }
  let(:player2) { Array.new }

  describe '#initialize' do
    it "deck has 52 cards" do
      expect(d.stack_length).to eq(52)
    end

    it "checks if deck is an Array" do 
      expect(d.stack_type).to be_an(Array)
      
    end
  end

  describe "#deal_cards" do
    it "checks if each player has 5 cards" do
      d.deal_cards(player1, player2)
      expect(player1.length).to eq(5)
      expect(player2.length).to eq(5)
    end 
  end 

end