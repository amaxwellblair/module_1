

def step_down(arr, new_arr)

  arr.each do |element|            # => [1, [5, 3]], [5, 3], [3, 6, [4, 5, [6, 6]]], [4, 5, [6, 6]], [6, 6]
    if element.class == Array      # => false, true, false, false, false, false, true, false, false, true, false, false
      step_down(element, new_arr)  # => [1, 5, 3], [1, 5, 3, 3, 6, 4, 5, 6, 6], [1, 5, 3, 3, 6, 4, 5, 6, 6]
    else
      new_arr << element           # => [1], [1, 5], [1, 5, 3], [1, 5, 3, 3], [1, 5, 3, 3, 6], [1, 5, 3, 3, 6, 4], [1, 5, 3, 3, 6, 4, 5], [1, 5, 3, 3, 6, 4, 5, 6], [1, 5, 3, 3, 6, 4, 5, 6, 6]
    end                            # => [1], [1, 5], [1, 5, 3], [1, 5, 3], [1, 5, 3, 3], [1, 5, 3, 3, 6], [1, 5, 3, 3, 6, 4], [1, 5, 3, 3, 6, 4, 5], [1, 5, 3, 3, 6, 4, 5, 6], [1, 5, 3, 3, 6, 4, 5, 6, 6], [1, 5, 3, 3, 6, 4, 5, 6, 6], [1, 5, 3, 3, 6, 4, 5, 6, 6]
  end                              # => [5, 3], [1, [5, 3]], [6, 6], [4, 5, [6, 6]], [3, 6, [4, 5, [6, 6]]]
  new_arr                          # => [1, 5, 3], [1, 5, 3], [1, 5, 3, 3, 6, 4, 5, 6, 6], [1, 5, 3, 3, 6, 4, 5, 6, 6], [1, 5, 3, 3, 6, 4, 5, 6, 6]
end                                # => :step_down

def new_flatten(arr)

  new_arr = []  # => []

  arr.each do |element|         # => [[1, [5, 3]], [3, 6, [4, 5, [6, 6]]]]
    step_down(element,new_arr)  # => [1, 5, 3], [1, 5, 3, 3, 6, 4, 5, 6, 6]
  end                           # => [[1, [5, 3]], [3, 6, [4, 5, [6, 6]]]]
  return new_arr                # => [1, 5, 3, 3, 6, 4, 5, 6, 6]
end                             # => :new_flatten

# puts(new_flatten([[1,2],[3,[4,5]]]) == [1,2,3,4,5])  # => nil
puts(new_flatten([[1,[5,3]],[3,6,[4,5,[6,6]]]]) == [1,5,3,3,6,4,5,6,6,])  # => nil

# >> true