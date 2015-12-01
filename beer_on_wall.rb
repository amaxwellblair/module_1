

#99 bottles of beer on the wall, 99 bottles of beer.
#Take one down and pass it around, 98 bottles of beer on the wall.

def beer_song(num)
  num_beers = (1..num).to_a.reverse
  num_beers.each_with_index do |number,i|
    if number == 1
      puts "1 bottle of beer on the wall, 1 bottle of beer."
      puts "Take one down and pass it around, no more bottles of beer on the wall."
      puts "No more bottles of beer on the wall, no more bottles of beer."
      puts "Go to the store and buy some more, #{num} bottles of beer on the wall"
    else
      puts "#{number} bottles of beer on the wall, #{number} bottles of beer."
      puts ("Take one down and pass it around, #{num_beers[i+1]} bottles of beer"+
      " on the wall.")
    end
  end
  return
end

puts(beer_song 99)
