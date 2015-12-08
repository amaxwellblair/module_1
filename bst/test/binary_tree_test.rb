$LOAD_PATH.unshift(__dir__)

require 'minitest'
require 'pry'
require 'binary_tree'


class BinaryTreeTest < Minitest::Test
  attr_accessor :tree

  def setup
    @tree = BinaryTree.new
  end

  def test_create_tree
    assert_equal BinaryTree, tree.class
  end

  def test_root
    assert_equal nil, tree.rootie
  end

  def test_create_node
    tree.insert(2)
    assert_equal BinaryTree::Struct::Node, tree.rootie.class
  end

  def test_root_value
    tree.insert(2)
    assert_equal 2, tree.root
  end

  def text_max_one
    tree.insert(4)
    assert_equal 4, tree.max
  end

  def text_min_one
    tree.insert(4)
    assert_equal 4, tree.min
  end

  def test_root_left_link
    tree.insert(2)
    assert_equal nil, tree.rootie.left
  end

  def test_root_right_link
    tree.insert(2)
    assert_equal nil, tree.rootie.right
  end

  def test_root_left_link_for_node
    tree.insert(2)
    tree.insert(1)
    assert_equal BinaryTree::Struct::Node, tree.rootie.left.class
  end

  def test_root_right_link_for_node
    tree.insert(2)
    tree.insert(3)
    assert_equal BinaryTree::Struct::Node, tree.rootie.right.class
  end

  def test_insert_node_left_data
    tree.insert(2)
    tree.insert(1)
    assert_equal 1, tree.rootie.left.data
  end

  def test_insert_node_right_data
    tree.insert(2)
    tree.insert(3)
    assert_equal 3, tree.rootie.right.data
  end

  def test_max_two
    tree.insert(3)
    tree.insert(2)
    tree.insert(4)
    assert_equal 4, tree.max
  end

  def test_max_three
    tree.insert(5)
    tree.insert(4)
    tree.insert(3)
    tree.insert(7)
    tree.insert(8)
    assert_equal 8, tree.max
  end

  def test_min_two
    tree.insert(3)
    tree.insert(2)
    tree.insert(4)
    assert_equal 2, tree.min
  end

  def test_min_three
    tree.insert(5)
    tree.insert(4)
    tree.insert(3)
    tree.insert(7)
    tree.insert(8)
    assert_equal 3, tree.min
  end

  def test_insert_node_deep_right
    skip
    tree.insert(3)
    tree.insert(4)
    tree.insert(6)
    tree.insert(8)
    assert_equal true, tree.include?(6)
  end

  def test_insert_node_deep_left
    skip
    tree.insert(7)
    tree.insert(6)
    tree.insert(5)
    tree.insert(4)
    assert_equal true, tree.include?(4)
  end

  def test_include_two_nodes
    skip
    tree.insert(1)
    tree.insert(2)
    assert_equal true, tree.include?(2)
  end

  def test_not_include_two_nodes
    skip
    tree.insert(1)
    tree.insert(3)
    assert_equal false, tree.include?(2)
  end

  def test_include_three_nodes
    skip
    tree.insert(1)
    tree.insert(2)
    tree.insert(3)
    assert_equal true, tree.include?(3)
  end

  def test_not_include_three_nodes
    skip
    tree.insert(1)
    tree.insert(2)
    tree.insert(3)
    assert_equal false, tree.include?(4)
  end

  def test_depth_of_level_zero
    skip
    tree.insert(1)
    assert_equal 0, tree.depth_of(1)
  end

  def test_depth_of_level_one
    skip
    tree.insert(1)
    tree.insert(2)
    assert_equal 1, tree.depth_of(2)
  end

  def test_depth_of_level_two
    skip
    tree.insert(3)
    tree.insert(2)
    tree.insert(1)
    assert_equal 2, tree.depth_of(3)
  end

  def test_sort_nil
    skip
    assert_equal nil, tree.sort
  end

  def test_sort_one
    skip
    tree.insert(5)
    assert_equal [5], tree.sort
  end

  def test_sort_two
    skip
    tree.insert(5)
    tree.insert(4)
    assert_equal [4,5], tree.sort
  end

  def test_sort_three
    skip
    tree.insert(5)
    tree.insert(4)
    tree.insert(6)
    assert_equal [4,5,6], tree.sort
  end

  def test_sort_two_deep
    skip
    tree.insert(5)
    tree.insert(4)
    tree.insert(6)
    tree.insert(7)
    assert_equal [4,5,6,7], tree.sort
  end

  def test_sort_three_deep
    skip
    tree.insert(5)
    tree.insert(4)
    tree.insert(3)
    tree.insert(6)
    tree.insert(7)
    tree.insert(8)
    assert_equal [3,4,5,6,7,8], tree.sort
  end

  def test_load_return
    skip
    assert_equal 15, tree.load('testing_sample.txt')
  end

  def test_load_max
    skip
    tree.load('testing_sample.txt')
    assert_equal tree.max, 100
  end

  def test_load_min
    skip
    tree.load('testing_sample.txt')
    assert_equal tree.min, 1
  end

  def test_load_insert
    skip
    tree.load('testing_sample.txt')
    tree.insert(100000)
    assert_equal true, include?(100000)
  end

end
