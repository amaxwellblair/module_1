require'pry'

class BinaryTree
  attr_accessor :rootie


  def initialize
    @rootie = nil
  end

  def insert(data, node = rootie)
    if node == nil
      @rootie = create_node(data)
    else
      if node.data > data
        insert_left(data, node)
      elsif node.data < data
        insert_right(data, node)
      end
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
