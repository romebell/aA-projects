require 'byebug'

class MaxIntSet
  def initialize(max)
    @store = Array.new(max) { false }
  end

  def insert(num)
  
    @store[num] = true if is_valid?(num)
  end
  
  def remove(num)
    @store[num] = false
  end
  
  def include?(num)
    @store[num] == true
  end
  
  private
  
  def is_valid?(num)
    raise "Out of bounds" if num >= @store.length || num < 0
    true
  end

  def validate!(num)
  end
end


class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num) unless self[num].include?(num)
  end

# HELP!!!!!
  def remove(num)
   results = []
    self[num].each do |el|
      results << el if el != num 
    end
    self[num].push(results)
  end

  def show_bracket(num)
    store[num % num_buckets]
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  # def []=(num)
  #   @store[num % num_buckets] = num
  # end


  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if self.count < num_buckets && !self[num].include?(num)
      self[num].push(num)
      @count += 1
    elsif self.count > num_buckets && !self[num].include?(num)
      self.resize!
      self[num].push(num)
      @count += 1
    end
  end

  def remove(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store += Array.new(num_buckets)
  end
end
