class Array
  def my_bubble_sort
    return self if length <= 1

    loop do
      sorted = true
      (length - 1).times do |i|
        if self[i] > self[i+1]
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        end
      end
      break if sorted
    end
    self
  end

  def my_worse_min # O (n^2)
    my_bubble_sort.first
  end
  
  def my_min # O(n)
    smallest = first # O(1)
    self[1..-1].each do |el|   # O(n)
      smallest = el if el < smallest # O(1)
    end
    smallest # O(1)
  end

  def my_subarrays # 0(n^2)
    subarrays = [] # O(1)
    
    each_index do |i| # O(n)
      j = i # o(1)
      while j < length # O(n)
        subarrays << self[i..j] # We think this is O(1), but ask!
        j += 1 # O(1)
      end
    end
    subarrays #O(1)
  end

  def my_worst_subsums # O(n^3) n = 3
    sum = my_subarrays.first.reduce(&:+) # O(n^2) 

    my_subarrays[1..-1].each do |subarray| # O(n^2 + n)
      sum = subarray.reduce(&:+) if subarray.reduce(&:+) > sum # O(n)
    end
    
    sum # O(1)
  end

  def my_subsum
    largest_sum = first
    current_sum = first

    each_with_index do |el, i|
      next if i == 0
      current_sum = 0 if current_sum < 0
      current_sum += el

      if current_sum > largest_sum
        largest_sum = current_sum
      end
    end
    largest_sum
  end

end


if __FILE__ == $PROGRAM_NAME
  p [9,8,7].my_bubble_sort
  p [9,8,7].my_worse_min
  p [9,8,7].my_min
  puts "=============================="
  p [5, 3, -7].my_worst_subsums
  p [2, 3, -6, 7, -6, 7].my_worst_subsums
  p [-5, -1, -3].my_worst_subsums
  puts "=============================="
  p [5, 3, -7].my_subsum
  p [2, 3, -6, 7, -6, 7].my_subsum
  p [-5, -1, -3].my_subsum
end