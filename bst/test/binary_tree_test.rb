$LOAD_PATH.unshift(__dir__)
$LOAD_PATH.unshift("~/turing/1module/bst/lib/")

require 'minitest'
require 'pry'
require 'binary_tree'


class BinarySearchTreeTest < Minitest::Test
  attr_accessor :tree

  def setup
    @tree = BinarySearchTree.new
  end

  def test_create_tree
    assert_equal BinarySearchTree, tree.class
  end

  def test_root
    assert_equal nil, tree.rootie
  end

  def test_create_node
    tree.insert(2)
    assert_equal BinarySearchTree::Struct::Node, tree.rootie.class
  end

  def test_create_node_return
    assert_equal 0, tree.insert(2)
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
    assert_equal BinarySearchTree::Struct::Node, tree.rootie.left.class
  end

  def test_root_right_link_for_node
    tree.insert(2)
    tree.insert(3)
    assert_equal BinarySearchTree::Struct::Node, tree.rootie.right.class
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

  def test_insert_node_right_return
    tree.insert(2)
    tree.insert(3)
    assert_equal 2, tree.insert(4)
  end

  def test_insert_node_left_return
    tree.insert(5)
    tree.insert(7)
    tree.insert(3)
    tree.insert(4)
    assert_equal 2, tree.insert(1)
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
    tree.insert(3)
    tree.insert(4)
    tree.insert(6)
    tree.insert(8)
    assert_equal true, tree.include?(6)
  end

  def test_insert_node_deep_left
    tree.insert(7)
    tree.insert(6)
    tree.insert(5)
    tree.insert(4)
    assert_equal true, tree.include?(4)
  end

  def test_include_root_nodes
    tree.insert(1)
    assert_equal true, tree.include?(1)
  end

  def test_include_two_nodes
    tree.insert(1)
    tree.insert(2)
    assert_equal true, tree.include?(2)
  end

  def test_not_include_two_nodes
    tree.insert(1)
    tree.insert(3)
    assert_equal false, tree.include?(2)
  end


  def test_include_three_nodes
    tree.insert(2)
    tree.insert(1)
    tree.insert(3)
    assert_equal true, tree.include?(3)
  end

  def test_not_include_three_nodes
    tree.insert(1)
    tree.insert(2)
    tree.insert(3)
    assert_equal false, tree.include?(4)
  end

  def test_include_level_two
    tree.insert(4)
    tree.insert(3)
    tree.insert(1)
    tree.insert(2)
    tree.insert(5)
    tree.insert(6)
    assert_equal true, tree.include?(2)
  end

  def test_depth_of_level_zero
    tree.insert(1)
    assert_equal 0, tree.depth_of(1)
  end

  def test_depth_of_level_one
    tree.insert(1)
    tree.insert(2)
    assert_equal 1, tree.depth_of(2)
  end

  def test_depth_of_level_two
    tree.insert(3)
    tree.insert(2)
    tree.insert(1)
    assert_equal 2, tree.depth_of(1)
  end

  def test_depth_of_level_three
    tree.insert(3)
    tree.insert(4)
    tree.insert(1)
    tree.insert(2)
    tree.insert(5)
    tree.insert(6)
    assert_equal 3, tree.depth_of(6)
  end

  def test_sort_nil
    assert_equal nil, tree.sort
  end

  def test_sort_one
    tree.insert(5)
    assert_equal [5], tree.sort
  end

  def test_sort_two
    tree.insert(5)
    tree.insert(4)
    assert_equal [4,5], tree.sort
  end

  def test_sort_three
    tree.insert(5)
    tree.insert(4)
    tree.insert(6)
    assert_equal [4,5,6], tree.sort
  end
  # meta(current: true)
  def test_sort_two_deep
    tree.insert(5)
    tree.insert(4)
    tree.insert(6)
    tree.insert(7)
    assert_equal [4,5,6,7], tree.sort
  end

  def test_sort_three_deep
    tree.insert(5)
    tree.insert(4)
    tree.insert(3)
    tree.insert(6)
    tree.insert(7)
    tree.insert(8)
    assert_equal [3,4,5,6,7,8], tree.sort
  end

  def test_load_return
    assert_equal 15, tree.load('/Users/maxwell/turing/1module/bst/lib/testing_sample.txt')
  end

  def test_load_max
    tree.load('/Users/maxwell/turing/1module/bst/lib/testing_sample.txt')
    assert_equal 100, tree.max
  end

  def test_load_min
    tree.load('/Users/maxwell/turing/1module/bst/lib/testing_sample.txt')
    assert_equal tree.min, 1
  end

  def test_load_insert
    tree.load('/Users/maxwell/turing/1module/bst/lib/testing_sample.txt')
    tree.insert(100000)
    assert_equal true, tree.include?(100000)
  end

  def test_load_insert
    tree.load('/Users/maxwell/turing/1module/bst/lib/testing_sample.txt')
    tree.insert("a")
    assert_equal nil, tree.include?("a")
  end

  def test_leaves_nil
    assert_equal nil, tree.leaves
  end

  def test_leaves_zero_with_root
    tree.insert(1)
    assert_equal 1, tree.leaves
  end

  def test_leaves_one
    tree.insert(2)
    tree.insert(1)
    assert_equal 1, tree.leaves
  end

  def test_leaves_two
    tree.insert(2)
    tree.insert(1)
    tree.insert(3)
    assert_equal 2, tree.leaves
  end

  def test_leaves_three

    tree.insert(4)
    tree.insert(2)
    tree.insert(3)
    tree.insert(5)
    tree.insert(6)
    tree.insert(1)
    assert_equal 3, tree.leaves
  end

  def test_leaves_nil
    assert_equal nil, tree.leaves
  end

  def test_height_zero_with_root
    tree.insert(1)
    assert_equal 0, tree.height
  end

  def test_height_one
    tree.insert(2)
    tree.insert(1)
    assert_equal 1, tree.height
  end

  def test_height_two
    tree.insert(2)
    tree.insert(1)
    tree.insert(3)
    assert_equal 1, tree.height
  end

  def test_height_three
    tree.insert(4)
    tree.insert(2)
    tree.insert(3)
    tree.insert(5)
    tree.insert(6)
    tree.insert(1)
    assert_equal 2, tree.height
  end

  def test_delete_root_return
    tree.insert(4)
    assert_equal 4, tree.delete(4)
  end

  def test_delete_root
    tree.insert(4)
    tree.delete(4)
    assert_equal nil, tree.rootie
  end

  def test_delete_node_tail
    tree.insert(4)
    tree.insert(3)
    tree.insert(5)
    tree.insert(1)
    tree.delete(1)
    assert_equal false, tree.include?(1)
  end

  def test_delete_node_in_middle
    tree.insert(4)
    tree.insert(3)
    tree.insert(5)
    tree.insert(1)
    tree.delete(5)
    assert_equal false, tree.include?(5)
  end

  def test_delete_node_root
    tree.insert(4)
    tree.insert(3)
    tree.insert(5)
    tree.insert(1)
    tree.delete(4)
    assert_equal true, tree.include?(5)
  end

  def test_delete_node_root_equal
    tree.insert(4)
    tree.insert(3)
    tree.insert(5)
    tree.insert(1)
    tree.delete(4)
    assert_equal false, tree.include?(4)
  end

  def test_delete_node_leaf_equal
    tree.insert(4)
    tree.insert(3)
    tree.insert(5)
    tree.insert(1)
    tree.delete(3)
    assert_equal true, tree.include?(1)
  end

  def test_delete_node_leaf_equal
    tree.insert(4)
    tree.insert(3)
    tree.insert(5)
    tree.insert(1)
    assert_equal nil, tree.delete("a")
  end

  def test_delete_node_equal_nil
    tree.insert(4)
    tree.insert(3)
    tree.insert(5)
    tree.insert(1)
    assert_equal nil, tree.delete(100)
  end

  #refactor tests

  def test_insert_alpha
    tree.insert("a")
    tree.insert("b")
    tree.insert("c")
    assert_equal true, tree.include?("a")
  end

  def test_insert_alpha_and_num
    tree.insert("a")
    tree.insert("b")
    tree.insert(100000)
    assert_equal "b", tree.max
  end

  def test_insert_alpha_deep_right
    tree.insert("a")
    tree.insert("b")
    tree.insert("c")
    assert_equal true, tree.include?("b")
  end

  def test_insert_alpha_delete
    tree.insert("a")
    tree.insert("b")
    tree.insert("c")
    assert_equal 3, tree.insert("d")
  end


end
