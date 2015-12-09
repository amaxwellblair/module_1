$LOAD_PATH.unshift("~/turing/1module/bst/lib/")

require 'pry'

class BinaryTree
  attr_accessor :rootie, :type


  def initialize
    @rootie = nil
  end

  def insert(data, node = rootie)
    if empty?
      @rootie = create_node(data)
      @type = data.class
    elsif not_type?(data)
      # raise StandardError.new("Data inserted is of a different type")
      puts "Data inserted is a different type"
    elsif include?(data)
      # raise StandardError.new("Data inserted already on tree")
      puts "Data inserted already on tree"
    else
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

  def prep_check?(data)
    if empty?
      return true
    elsif not_type?(data)
      return true
    end
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
    else
      insert(data, node.left)
    end
  end

  def insert_right(data, node)
    if empty?(node.right)
      node.right = create_node(data)
    else
      insert(data, node.right)
    end
  end

  def not_type?(data)
    data.class != type ? true : false
  end


  Struct.new("Node", :data, :left, :right)

  def create_node(data, left = nil, right = nil)
    Struct::Node.new(data, left, right)
  end

end
