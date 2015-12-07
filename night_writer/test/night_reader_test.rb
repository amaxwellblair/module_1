require 'minitest'
require 'alphabet'
require 'night_reader'


class NightReaderTest < Minitest::Test
  include Alphabet

  def test_class
    reader = NightReader.new("")
    assert_equal NightReader, reader.class
  end

  def test_machine
    str = ""
    assert_equal NightReader.new("\n\n\n").compute, str
    assert_equal NightReader.new("0.\n00\n..\n").compute, "h"
    assert_equal NightReader.new(".00.\n.0..\n00..\n").compute, "1"
    #assert_equal NightReader.new("..\n..\n.0\n.0\n.0\n.0\n").compute, "L"
  end

  def test_alphabet
    skip
    assert_equal 34, Alphabet::Braille.count
    assert_equal 34, Alphabet::English.count
  end

  def test_file_io
    skip
    assert_equal true, __  #output file empty?
    assert_equal true, __
  end

  def test_puts
    skip
    assert_equal "Created 'braille.txt' containing 256 characters", __
  end

end
