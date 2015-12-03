# require 'open-uri'
#
# file_of_words = []
#
# open('https://gist.githubusercontent.com/stevekinney/c0b7cd61d6c1ecd727ca/raw/eb3c848183309d5c26239c854f5f71bca4f6e93b/word-list.txt') do |f|
#   f.each_line{|line| file_of_words << line}
# end
#
# # file_of_words = File.readlines("word-list.txt")
#
#
# vowel_ideal = "aeiouy"
# arr = []
#
# k = file_of_words.map do |word|
#   word_array = word.chars
#   word_array.keep_if { |v| v=~ /[aeiouy]/}
#   if word_array.join == vowel_ideal
#     word
#   end
# end
#
# puts k

file_of_words = File.readlines("word-list.txt")
vowel_ideal = "aeiouy"

winner = file_of_words.map do |word|
 word_array = word.chars
 word_array.keep_if { |v| v=~ /[aeiouy]/}
 if word_array.join == vowel_ideal
   word
 end
end

p file_of_words
