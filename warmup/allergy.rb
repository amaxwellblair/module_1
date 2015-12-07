
allergy = {
1 =>"eggs",
2 => "peanuts",
4 => "shellfish",
8 =>"strawberries",
16 =>"tomatoes",
32 =>"chocolate",
64 =>"pollen",
128 => "cats"

}

john = 3

binary = john.to_s(2)
allergy_arr = []
binary.each_char.with_index do |bin, i|
  hsh_num = (bin + "0"*i).to_i(2)
  allergy_arr << allergy[hsh_num]
end

puts allergy_arr
