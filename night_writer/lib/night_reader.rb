$: << '.'  # => ["/Users/maxwell/.rvm/gems/ruby-2.2.1/gems/seeing_is_believing-3.0.0.beta.6/lib", "/Users/maxwell/.rvm/gems/ruby-2.2.1/gems/seeing_is_believing-3.0.0.beta.6/lib", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/x86_64-darwin14", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/vendor_ruby/2.2.0", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/vendor_ruby/2.2.0/x86_64-darwin14", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/vendor_ruby", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/x86_64-darwin14", "."]

require 'alphabet'  # ~> LoadError: cannot load such file -- alphabet
require 'pry'


output_file = ARGV[1]

class NightReader
  attr_accessor :raw_text, :raw_braille
  include Alphabet

  def initialize
    @raw_text = File.read(ARGV[0])

  end

  def output_text
    first_line = ""
    second_line = ""
    third_line = ""
    @raw_braille.each do |letter|
      first_line += letter[0]
      second_line += letter[1]
      third_line += letter[2]
    end
    File.open(ARGV[1],'w') do |f|
      3.times do |i|
        f.write("#{first_line}\n#{second_line}\n#{third_line}\n")
      end
    end
  end


  def compute
    @raw_text = raw_text.gsub("\n", "")
    @raw_braille = []
    @raw_text.each_char do |char|
      @raw_braille << Alphabet::English[char.to_sym]
    end

    output_text
    output_text
  end

end


x = NightReader.new

x.compute


p x.raw_braille

# ~> LoadError
# ~> cannot load such file -- alphabet
# ~>
# ~> /Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/maxwell/turing/1module/night_writer/lib/night_reader.rb:3:in `<main>'
