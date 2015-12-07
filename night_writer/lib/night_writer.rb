$LOAD_PATH.unshift(__dir__)

require 'alphabet'
require 'pry'
CharacterLimit = 80

class NightWriter
  attr_accessor :raw_text, :raw_braille, :tally
  include Alphabet

  def initialize(str)
    self.raw_text = str
  end

  def compute
    self.tally = 0
    num_flag = 0
    self.raw_text = raw_text.gsub("\n", "")
    self.raw_braille = []
    # sub_contractions #=> Didn't have time to implement
    self.raw_text.each_char.with_index do |char, i|
      if char =~ /[a-zA-Z]/ && char == char.upcase
        self.raw_braille << Alphabet::English["cap"]
        self.raw_braille << Alphabet::English[char.downcase]
      elsif char =~ /[0-9]/
        if num_flag == 0
          self.raw_braille << Alphabet::English["#"]
          self.raw_braille << Alphabet::EnglishNumber[char]
          num_flag = 1
        else
          self.raw_braille << Alphabet::EnglishNumber[char]
        end
      elsif char == " " && num_flag == 1
        self.raw_braille << Alphabet::English[char]
        num_flag = 0
      else
        self.raw_braille << Alphabet::English[char.downcase]
      end
      self.tally += 1
    end
    output_text
  end

  private

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

  def sub_contractions
    Alphabet::Contract_ASCII.each do |contraction, char|
      self.raw_text.gsub(contraction, char)
    end
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
