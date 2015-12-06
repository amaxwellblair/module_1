

module FileIO

  def FileIO.nightreader
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
  end

  def FileIO.nightwriter
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
  end
end
