$: << '~/turing/1module/night_writer/lib'

require 'alphabet'
require 'pry'
CharacterLimit = 80

class NightReader
  attr_accessor :raw_text, :raw_braille, :raw_binary, :tally
  include Alphabet

  def initialize(str)
    self.raw_braille = str

  end

  def output_text
    i = 0
    cap_flag = 0
    formatted_binary = []
    while i < raw_binary[0].length
      formatted_binary << (raw_binary[0][i] + raw_binary[0][i+1]+
                           raw_binary[1][i] + raw_binary[1][i+1]+
                           raw_binary[2][i] + raw_binary[2][i+1])
      i += 2
    end
    self.raw_text = ""
    formatted_binary.each do |binary|
      decimal_letter = binary.to_i(2)
      #62 is shift key for caps
      if decimal_letter == 62
         cap_flag = 1
      else
        if cap_flag == 1
          self.raw_text += Alphabet::Braille[decimal_letter].upcase
          cap_flag = 0
        else
          self.raw_text += Alphabet::Braille[decimal_letter]
        end
        self.tally += 1
      end
    end

    return raw_text
  end

  def compute
    self.tally = 0
    self.raw_binary = []
    if raw_braille == ""
      return ""
    end
    self.raw_braille = raw_braille.split("\n")
    formated_braille = ["","",""]
    i = 0
    puts raw_braille
    while i < raw_braille.length
      formated_braille[0] += raw_braille[i]
      formated_braille[1] += raw_braille[i+1]
      formated_braille[2] += raw_braille[i+2]
      i += 3
    end
    formated_braille.each do |line|
      self.raw_binary << line.gsub(".","1")
    end

    output_text
  end

end

if __FILE__ == $0
  input_file = ARGV[0]
  output_file = ARGV[1]
  x = NightReader.new(File.read(input_file))
  text_lines = x.compute
  File.open(output_file,'w') do |f|
    f.write(text_lines)
    puts "Created #{ARGV[1]} containing #{x.tally} characters"
  end
end
