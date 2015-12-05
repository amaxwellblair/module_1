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
    formatted_binary = []
    while i < raw_binary[0].length
      formatted_binary << raw_binary[0][i] + raw_binary[0][i+1]+
                          raw_binary[1][i] + raw_binary[1][i+1]+
                          raw_binary[2][i] + raw_binary[2][i+1]
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
      return raw_text
    end
  end

  def compute
    self.tally = 0
    cap_flag = 0
    self.raw_binary = []
    if raw_braille == ""
      return ""
    end
    self.raw_braille = raw_braille.split("\n")
    self.raw_braille == [] ? self.raw_braille = ["","",""] : nil

    self.raw_binary = raw_braille.map do |line|
      line.gsub(".","1")
    end

    output_text
  end

end

# if __FILE__ == $0
#   input_file = ARGV[0]
#   output_file = ARGV[1]
#   x = NightReader.new(File.read(input_file))
#   braille_lines = x.compute
#   first_line = braille_lines[0]
#   second_line = braille_lines[1]
#   third_line = braille_lines[2]
#
#   File.open(output_file,'w') do |f|
#     line_count = (x.raw_braille.length/CharacterLimit)+1
#     line_count.times do |i|
#       f.write("#{first_line[(i*CharacterLimit)..((i+1)*CharacterLimit-1)]}\n"+
#               "#{second_line[((i*CharacterLimit)..((i+1)*CharacterLimit-1))]}\n"+
#               "#{third_line[(i*CharacterLimit)..((i+1)*CharacterLimit-1)]}\n")
#     end
#     puts "Created 'braille.txt' containing #{x.tally} characters"
#   end
# end
