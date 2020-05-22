=begin About
My implementation of the bubble sort algorithm
=end

=begin Algorithm
1. Create a flag set to true
1.5 Loop body
2. Compare the first two items in an array
3. Is LHS > RHS?
  yes -> swap LHS and RHS
  no -> continue
4. Compare 2nd and 3rd items in the array
=end

require "pry"

class Array # TIL you can create your own methods for default classes
  def swap!(a,b)  #  a and b are indices not values!
    self[a], self[b] = self[b], self[a]
  self
  end
end

def bubble_sort(list)
  no_swaps = false

  until no_swaps # controls looping through sort iterations
    no_swaps = true    # reset the counter
    for i in 1...list.length # controls loop of sorting list
      if list[i - 1] > list[i]
        list.swap!((i - 1), i)
        no_swaps = false
        #binding.pry
      end
    end
  end
  list
end

p bubble_sort([4,3,78,2,0,2])