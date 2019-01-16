class Array
  def my_uniq
    results = []
    
    self.length.times do |i|
      results << self[i] unless results.include?(self[i])
    end

    results
  end
end