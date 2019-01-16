class Array
  def my_uniq
    results = []
    
    self.length.times do |i|
      results << self[i] unless results.include?(self[i])
    end

    results
  end

  def two_sum
    results = []

    self.length.times do |i|
      ((i + 1)...self.length).each do |j|
        results << [i,j] if self[i] + self[j] == 0
      end
    end

    results
  end
end