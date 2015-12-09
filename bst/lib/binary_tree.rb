$LOAD_PATH.unshift("~/turing/1module/bst/lib/")

require 'pry'

class BinaryTree
  attr_accessor :rootie


  def initialize
    @rootie = nil
  end

  def insert(data, node = rootie)
    if empty?
      @rootie = create_node(data)
    else
      if node.data > data
        insert_left(data, node)
      elsif node.data < data
        insert_right(data, node)
      end
    end
  end

  def include?(data, node = rootie)
    if empty?
      return nil
    elsif
      node.data == data
      return true
    elsif node.data > data && node.left != nil
      include?(data, node.left)
    elsif node.data < data && node.right != nil
      include?(data, node.right)
    else
      return false
    end
  end

  def depth_of(data, count = -1, node = rootie)
    count += 1
    if empty?
      return nil
    elsif node.data == data
      return count
    elsif node.data > data && node.left != nil
      depth_of(data, count, node.left)
    elsif node.data < data && node.right != nil
      depth_of(data, count, node.right)
    else
      return nil
    end
  end


  def sort(arr = [], node = rootie)
    # binding.pry
    if empty?
      return nil
    elsif node.left != nil || node.right != nil
      if node.left != nil
        sort(arr, node.left)
      end
      arr << node.data
      if node.right != nil
        sort(arr, node.right)
      end
    else
      arr << node.data
    end
    arr
  end

  def load(file_extension)
    count = 0
    @rootie = nil
    File.open(file_extension) do |f|
      f.each do |line|
        no_new = line.chomp
        if no_new =~ /[0-9]/
          insert(no_new.to_i)
        else
          insert(no_new)
        end
        count += 1
      end
    end
    return count
  end

  def root
    rootie.data
  end

  def max
    max_node.data
  end

  def min
    min_node.data
  end

  private

  def empty?
    rootie == nil ? true : false
  end

  def max_node(node = rootie)
    if node.right == nil
      return node
    else
      max_node(node.right)
    end
  end

  def min_node(node = rootie)
    if node.left == nil
      return node
    else
      min_node(node.left)
    end
  end


  def insert_left(data, node)
    if node.left == nil
      node.left = create_node(data)
    else
      insert(data, node.left)
    end
  end

  def insert_right(data, node)
    if node.right == nil
      node.right = create_node(data)
    else
      insert(data, node.right)
    end
  end


  Struct.new("Node", :data, :left, :right)

  def create_node(data, left = nil, right = nil)
    Struct::Node.new(data, left, right)
  end


end
