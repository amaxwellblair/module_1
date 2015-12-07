require 'minitest'
require 'alphabet'
require 'night_writer'

class NightWriterTest < Minitest::Test
  include Alphabet

  def setup

  end

  def test_class
    writer = NightWriter.new("a")
    assert_equal NightWriter, writer.class
  end

  def test_machine
    assert_equal NightWriter.new("").compute, (["","",""])
    assert_equal NightWriter.new("a").compute, (["0.","..",".."])
    assert_equal NightWriter.new("hello world").compute, (["0.0.0.0.0....00.0.0.00",
                                                           "00.00.0..0..00.0000..0",
                                                           "....0.0.0....00.0.0..."])
    assert_equal NightWriter.new("Hello World").compute, (["..0.0.0.0.0......00.0.0.00",
                                                           "..00.00.0..0....00.0000..0",
                                                           ".0....0.0.0....0.00.0.0..."])
    assert_equal NightWriter.new("Hello World\n").compute, (["..0.0.0.0.0......00.0.0.00",
                                                             "..00.00.0..0....00.0000..0",
                                                             ".0....0.0.0....0.00.0.0..."])
    assert_equal NightWriter.new("Hello World!").compute, (["..0.0.0.0.0......00.0.0.00..",
                                                            "..00.00.0..0....00.0000..000",
                                                            ".0....0.0.0....0.00.0.0...0."])
    assert_equal NightWriter.new("hello 123 dog").compute, (["0.0.0.0.0....00.0.00..000.00",
                                                             "00.00.0..0...0..0......0.000",
                                                             "....0.0.0...00..........0..."])

  end

  def test_alphabet
    assert_equal 35, Alphabet::Braille.count
    assert_equal 35, Alphabet::English.count
  end

end
