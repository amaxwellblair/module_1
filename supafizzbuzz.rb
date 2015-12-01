 # If it's evenly divisible by 3, 5, and 7 print SuperFizzBuzz
# If it's evenly divisible by 3 and 7 print SuperFizz
# If it's evenly divisible by 5 and 7 print SuperBuzz
# If it's evenly divisible by 3, print Fizz
# If it's evenly divisible by 5, print Buzz
# If it's evenly divisible by 7, print Super
# Otherwise print just the number

def supafizbuz(max_num)
  # range = (0..max_num).to_a
  # range.each do |num|
  #   if num % 3 == 0
  #     if num % 7 == 0
  #       if num % 5 == 0
  #         puts("SuperFizzBuzz")
  #         next
  #       end
  #       puts("SuperFizz")
  #       next
  #     end
  #     puts("Fizz")
  #     next
  #   elsif num % 7 == 0
  #     if num % 5 == 0
  #       puts("SuperBuzz")
  #       next
  #     end
  #     puts("Super")
  #     next
  #   elsif num % 5 == 0
  #     puts("Buzz")
  #     next
  #   end
  #   puts(num)
  # end
  # return nil

  range = (0..max_num).to_a
  range.each do |num|
    a = num % 7 == 0 ? "Super" : ""
    b = num % 3 == 0 ? "Fizz" : ""
    c = num % 5 == 0 ? "Buzz" : ""
    puts (a + b + c) == "" ? num : (a + b + c)
  end
  return nil

end

supafizbuz(1000)
