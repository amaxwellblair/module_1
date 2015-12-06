$LOAD_PATH.unshift(__dir__)

require 'alphabet'
require 'pry'
CharacterLimit = 80

class NightWriter
  attr_accessor :raw_text, :raw_braille, :tally
  include Alphabet

  def initialize(str)
    @raw_text = str
  end

  def output_text
    first_line = ""
    second_line = ""
    third_line = ""
    raw_braille.each do |letter|
      first_line += letter[0]
      second_line += letter[1]
      third_line += letter[2]
    end
    return [first_line, second_line, third_line]
  end

  def compute
    @tally = 0
    @raw_text = raw_text.gsub("\n", "")
    @raw_braille = []
    @raw_text.each_char do |char|
      if char =~ /[a-zA-Z]/ && char == char.upcase
        @raw_braille << Alphabet::English["cap"]
        @raw_braille << Alphabet::English[char.downcase]
      else
        @raw_braille << Alphabet::English[char.downcase]
      end
      @tally += 1
    end

    output_text
  end

end

if __FILE__ == $PROGRAM_NAME
  input_file = ARGV[0]
  output_file = ARGV[1]
  x = NightWriter.new(File.read(input_file))
  braille_lines = x.compute
  first_line = braille_lines[0]
  second_line = braille_lines[1]
  third_line = braille_lines[2]

  File.open(output_file,'w') do |f|
    line_count = (x.raw_braille.length*2/CharacterLimit)+1
    line_count.times do |i|
      f.write("#{first_line[(i*CharacterLimit)..((i+1)*CharacterLimit-1)]}\n"+
              "#{second_line[((i*CharacterLimit)..((i+1)*CharacterLimit-1))]}\n"+
              "#{third_line[(i*CharacterLimit)..((i+1)*CharacterLimit-1)]}\n")
    end
    puts "Created #{ARGV[1]} containing #{x.tally} characters"
  end
end
