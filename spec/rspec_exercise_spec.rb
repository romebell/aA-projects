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
end