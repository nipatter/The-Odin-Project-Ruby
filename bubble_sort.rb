# ABOUT
# My implementation of the bubble sort algorithm

# ALGORITHM
# 1. Create a flag set to true
# 1.5 Loop body
# 2. Compare the first two items in an array
# 3. Is LHS > RHS?
#   yes -> swap LHS and RHS
#   no -> continue
# 4. Compare 2nd and 3rd items in the array

# Modification to built-in Array class
class Array
  def swap!(left, right)
    self[left], self[right] = self[right], self[left]
  end
end

def bubble_sort(list)
  no_swaps = false

  until no_swaps
    no_swaps = true
    1.upto(list.length - 1) do |i|
      next unless list[i - 1] > list[i]

      list.swap!((i - 1), i)
      no_swaps = false
    end
  end
  list
end

puts bubble_sort([4, 3, 78, 2, 0, 2]).inspect
