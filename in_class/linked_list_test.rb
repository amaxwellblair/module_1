$LOAD_PATH.unshift(__dir__)

require 'minitest/autorun'
require 'minitest/pride'
require 'linked_list'

class LinkedListTest < Minitest::Test
  attr_accessor :new_class
  def setup
    data = 1
    @new_class = List.new(data)
  end

  def test_create_node
    assert_equal new_class.head.class, List::Node
  end

  def test_class
    assert_equal new_class.class, List
  end

  def test_tail
    skip
    assert_equal new_class.tail, tail
  end

  def test_append
    skip
    data_point = "c"
    assert_equal new_class.append(data_point).tail, data_point
  end

  def test_includes?
    skip
    assert_equal new_class.includes?("a"), true
    assert_equal new_class.includes?("Z"), false
  end

  def test_pop
    skip
    new_class.append("c")
    assert_equal new_class.pop, "c"
  end

  def test_count
    skip
    assert_equal new_class.count, 2
  end

  def test_head
    skip
    assert_equal new_class.head, head
  end

  def test_find_by_index
    skip
    assert_equal new_class.find_by_index(1), "b"
  end

  def test_find_by_value
    skip
    assert_equal new_class.find_by_value("a"), 0
  end

  def test_remove_by_value
    skip
    new_class.remove_by_value("b")
    assert_equal new_class.includes?("b"), false
  end

  def test_remove_by_index
    skip
    new_class.remove_by_index(1)
    assert_equal new_class.includes?("b"), false
  end
end
