require 'rspec'
require 'rspec_exercise'

RSpec.describe Array do
  subject(:digits) { Array.new([1,1,2,3])}

  describe "#my_uniq" do
    it "returns an array object" do
      expect(digits.my_uniq).to be_an(Array)
    end

    it "returns unique array" do
      expect(digits.my_uniq).to eq([1,2,3])
    end
  end

  subject(:numbers) { Array.new([-1, 0, 2, -2, 1]) }
  

  describe "#two_sum" do 
    

    it "returns an array object" do
      expect(numbers.two_sum).to be_an(Array)
    end

    it "results to contain only arrays" do
      expect(numbers.two_sum).not_to include(Integer)
    end 

    it "returns correct pairs of that sum to zero" do
      expect(numbers.two_sum).to eq([[0,4], [2,3]])

    end

    it "smaller first elements come first" do
      first_ele = numbers.two_sum.map { |el| el[0] }
      expect(first_ele).to eq(first_ele.sort)
    end

    it "smaller second elements come first" 
    #   first_ele = numbers.two_sum.map { |el| el[0] }
    #   is_first = first_ele.all? { |sub_ele| sub_ele == first_ele[0] }
    #   second_ele = numbers.two_sum.map { |el| el[1] }
    #   p "checking..."
  
    #   expect(is_first).to be true
    #   expect(second_ele).to eq(second_ele.sort)
        
  end
end