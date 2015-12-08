$LOAD_PATH.unshift(__dir__)

require 'minitest/autorun'
require 'minitest/pride'
require 'linked_list'

class LinkedListTest < Minitest::Test
  attr_accessor :new_class
  def setup
    data = 1
    @new_class = List.new
    @new_class.append(data)
  end

  def test_create_node
    assert_equal new_class.header.class, List::Node
  end

  def test_node_saved
    assert_equal 1, new_class.head
  end

  def test_class
    assert_equal List, new_class.class
  end

  def test_tail
    assert_equal 1, new_class.tail
  end

  def test_append_one
    new_class.append("b")
    assert_equal "b", new_class.tail
  end

  def test_append_three
    new_class.append("b")
    new_class.append("c")
    new_class.append("d")
    assert_equal "d", new_class.tail
  end

  def test_prepend
    new_class.prepend("b")
    assert_equal "b", new_class.head
  end

  def test_includes_one
    new_class.append("a")
    assert_equal true, new_class.include?("a")
    assert_equal false, new_class.include?("Z")
  end

  def test_includes_two
    new_class.append("a")
    new_class.append("b")
    assert_equal true, new_class.include?("a")
    assert_equal false, new_class.include?("z")
  end

  def test_insert
    new_class.append(2)
    new_class.append(3)
    new_class.append(4)
    new_class.append(5)
    new_class.insert(1, "HI!")
    assert_equal true, new_class.include?("HI!")
  end

  def test_pop
    new_class.append("b")
    new_class.append("c")
    assert_equal "c", new_class.pop.data
    assert_equal "b", new_class.tail
  end

  def test_count_one
    assert_equal 1, new_class.count
  end


  def test_count_two
    new_class.append("a")
    assert_equal 2, new_class.count
  end

  def test_count_three
    new_class.append("a")
    new_class.append("b")
    assert_equal 3, new_class.count
  end

  def test_head
    assert_equal 1, new_class.head 
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
    assert_equal new_class.include?("b"), false
  end

  def test_remove_by_index
    skip
    new_class.remove_by_index(1)
    assert_equal new_class.include?("b"), false
  end
end
