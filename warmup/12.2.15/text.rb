require 'open-uri'

file_of_words = []

open('https://gist.githubusercontent.com/stevekinney/c0b7cd61d6c1ecd727ca/raw/eb3c848183309d5c26239c854f5f71bca4f6e93b/word-list.txt') do |f|
  f.each_line{|line| file_of_words << line}
end

# file_of_words = File.readlines("word-list.txt")
vowel_ideal = "aeiouy"
arr = []
file_of_words.each do |word|
  word_array = word.chars
  word_array.keep_if { |v| v=~ /[aeiouy]/}
  if word_array.join == vowel_ideal
    arr << word
  end
end

puts arr
