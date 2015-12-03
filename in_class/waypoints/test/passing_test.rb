require 'minitest'

class PassingTest < Minitest::Test
  def test_pass
    assert_equal 1,1
  end
end

class FailingTest < Minitest::Test
  def test_fail
    assert_equal 1,2
  end

  def test_error
    aklsbhffa
  end

  def test_skip
    skip
    asfdaf
  end
end
