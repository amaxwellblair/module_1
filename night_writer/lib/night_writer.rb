$LOAD_PATH.unshift(__dir__)

require 'alphabet'
require 'pry'
CharacterLimit = 80

class NightWriter
  attr_accessor :raw_text, :tally
  include Alphabet

  def initialize(str)
    self.raw_text = str
  end

  def preformat_input_text(text)
    text.gsub("\n", "")
  end

  def compute
    self.tally = 0
    num_flag = 0
    # self.raw_text = raw_text.gsub("\n", "")
    preformatted = preformat_input_text(raw_text)
    raw_braille = []
    # sub_contractions #=> Didn't have time to implement
    preformatted.each_char.with_index do |char, i|
      if char =~ /[a-zA-Z]/ && char == char.upcase
        raw_braille << Alphabet::English["cap"]
        raw_braille << Alphabet::English[char.downcase]
        # maybe? Alphabet::English["cap"] + Alphabet::English[char.downcase]
      elsif char =~ /[0-9]/
        if num_flag == 0
          raw_braille << Alphabet::English["#"]
          raw_braille << Alphabet::EnglishNumber[char]
          num_flag = 1
        else
          raw_braille << Alphabet::EnglishNumber[char]
        end
      elsif char == " " && num_flag == 1
        raw_braille << Alphabet::English[char]
        num_flag = 0
      else
        raw_braille << Alphabet::English[char.downcase]
      end
      self.tally += 1
    end
    output_text(raw_braille)
  end

  private

  def output_text(raw)
    first_line = ""
    second_line = ""
    third_line = ""
    raw.each do |letter|
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
