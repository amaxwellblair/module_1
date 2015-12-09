$LOAD_PATH.unshift("~/turing/1module/bst/lib/")

require 'pry'

class BinarySearchTree
  attr_accessor :rootie, :type, :leaves, :height

  def initialize
    @rootie = nil
    @leaves = nil
    @height = nil
  end

  def insert(data, node = rootie)
    if empty?
      first_insert(data)
    elsif not_type?(data)
      puts "Data inserted is a different type"
    elsif include?(data)
      puts "Data inserted already on tree"
    else
      node_leaf?(node) ? @leaves -= 1 : nil
      if node.data > data
        insert_left(data, node)
      elsif node.data < data
        insert_right(data, node)
      end
    end
  end

  def include?(data, node = rootie)
    if prep_check?(data)
      return nil
    elsif
      node.data == data
      return true
    elsif node.data > data && !empty?(node.left)
      include?(data, node.left)
    elsif node.data < data && !empty?(node.right)
      include?(data, node.right)
    else
      return false
    end
  end

  def depth_of(data, count = -1, node = rootie)
    count += 1
    if prep_check?(data)
      return nil
    elsif node.data == data
      return count
    elsif node.data > data && !empty?(node.left)
      depth_of(data, count, node.left)
    elsif node.data < data && !empty?(node.right)
      depth_of(data, count, node.right)
    else
      return nil
    end
  end

  def sort(arr = [], node = rootie)
    # binding.pry
    if empty?(rootie)
      return nil
    elsif !empty?(node.left) || !empty?(node.right)
      if !empty?(node.left)
        sort(arr, node.left)
      end
      arr << node.data
      if !empty?(node.right)
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
        no_new =~ /[0-9]/ ? insert(no_new.to_i) : insert(no_new)
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

  def prep_check?(data)
    if empty?
      return true
    elsif not_type?(data)
      return true
    end
  end

  def empty?(node = rootie)
    node == nil ? true : false
  end

  def max_node(node = rootie)
    if empty?(node.right)
      return node
    else
      max_node(node.right)
    end
  end

  def min_node(node = rootie)
    if empty?(node.left)
      return node
    else
      min_node(node.left)
    end
  end

  def insert_left(data, node)
    if empty?(node.left)
      node.left = create_node(data)
      @leaves += 1
      max_height(data)
    else
      insert(data, node.left)
    end
  end

  def insert_right(data, node)
    if empty?(node.right)
      node.right = create_node(data)
      @leaves += 1
      max_height(data)
    else
      insert(data, node.right)
    end
  end

  def first_insert(data)
    @rootie = create_node(data)
    @type = data.class
    @leaves = 1
    @height = 0
  end

  def max_height(data)
    if depth_of(data) > height
      @height = depth_of(data)
    end
  end

  def not_type?(data)
    data.class != type ? true : false
  end

  def node_leaf?(node)
    node.right == nil && node.left == nil ? true : false
  end

  Struct.new("Node", :data, :left, :right)

  def create_node(data, left = nil, right = nil)
    Struct::Node.new(data, left, right)
  end

end


tree = BinarySearchTree.new
tree.insert(2)
tree.insert(1)
tree.insert(3)
tree.leaves
