
def step_down(arr, new_arr)

  arr.each do |element|
    if element.class == Array
      step_down(element, new_arr)
    else
      new_arr << element
    end
  end
  new_arr
end

def new_flatten(arr)

  new_arr = []

  arr.each do |element|
    step_down(element,new_arr)
  end
  return new_arr
end

puts(new_flatten([[1,2],[3,[4,5]]]) == [1,2,3,4,5])
puts(new_flatten([[1,[5,3]],[3,6,[4,5,[6,6]]]]) == [1,5,3,3,6,4,5,6,6,])
