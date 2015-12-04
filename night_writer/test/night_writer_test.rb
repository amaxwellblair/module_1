require 'minitest'
require 'alphabet'

class NightWriterTest < Minitest::Test
  include Alphabet

  def setup
    skip
    writer = Machine.new("test.txt")
  end

  def test_class

    assert_equal Machine, writer.class
  end

  def test_machine
    skip
    assert_equal writer.compute (""), (__)
    assert_equal writer.compute("a"), (__)
    assert_equal writer.compute("hello world"), (__)
    assert_equal writer.compute("Hello World"), (__)
    assert_equal writer.compute, (__)
  end

  def test_alphabet
    assert_equal 27, Alphabet::Braille.count
    assert_equal 27, Alphabet::English.count
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
