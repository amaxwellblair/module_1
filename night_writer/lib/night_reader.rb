$LOAD_PATH.unshift(__dir__)

require 'alphabet'
require 'pry'
CharacterLimit = 80

class NightReader
  attr_accessor :raw_text, :raw_braille, :raw_binary, :tally
  include Alphabet

  def initialize(str)
    self.raw_braille = str
  end

  def compute
    self.tally = 0
    self.raw_binary = []
    if raw_braille == ""
      return ""
    end
    self.raw_braille = raw_braille.split("\n")
    format_braille.each do |line|
      self.raw_binary << line.gsub(".","1") #The alphabet in hash uses binary
    end
    output_text
  end

  private

  def format_braille
    formated_braille = ["","",""]
    i = 0
    while i < raw_braille.length
      formated_braille[0] += raw_braille[i]
      formated_braille[1] += raw_braille[i+1]
      formated_braille[2] += raw_braille[i+2]
      i += 3
    end
    return formated_braille
  end

  def format_binary
    formatted_binary = []
    i = 0
    while i < raw_binary[0].length
      formatted_binary << (raw_binary[0][i] + raw_binary[0][i+1]+
                           raw_binary[1][i] + raw_binary[1][i+1]+
                           raw_binary[2][i] + raw_binary[2][i+1])
      i += 2
    end
    return formatted_binary
  end

  def output_text
    cap_flag, num_flag = 0
    self.raw_text = ""
    format_binary.each do |binary|
      decimal_letter = binary.to_i(2)
      #62 is shift key for caps
      if decimal_letter == 62
        cap_flag = 1
      #40 is shift key for numbers
      elsif decimal_letter == 40
        num_flag = 1
      else
        if cap_flag == 1
          self.raw_text += Alphabet::Braille[decimal_letter].upcase
          cap_flag = 0
        elsif num_flag == 1
          if decimal_letter == 63
            self.raw_text += Alphabet::Braille[decimal_letter]
            num_flag = 0
          else
            self.raw_text += Alphabet::BrailleNumber[decimal_letter]
          end
        else
          self.raw_text += Alphabet::Braille[decimal_letter]
        end
        self.tally += 1
      end
    end
    return raw_text
  end

end

if __FILE__ == $PROGRAM_NAME
  input_file = ARGV[0]
  output_file = ARGV[1]
  x = NightReader.new(File.read(input_file))
  text_lines = x.compute
  File.open(output_file,'w') do |f|
    f.write(text_lines)
    puts "Created #{ARGV[1]} containing #{x.tally} characters"
  end
end
