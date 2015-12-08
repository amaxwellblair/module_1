require 'pry'

class List
  attr_accessor :header

  def initialize
    @header = nil
  end

  def head
    header.data
  end

  def tail
    find_end(header).data
  end

  def append(data, node = header)
    if node == nil
      @header = create_node(data, nil)
    else
      last = find_end(node)
      last.tail = create_node(data, nil)
    end
  end

  def prepend(data)
    @header = create_node(data, header)
  end

  def include?(data, node = header)
    if node.data == data
      return true
    elsif node.tail == nil
      return false
    else
      include?(data, node.tail)
    end
  end

  def insert(index, data, count = 0, node = header)
    if count == index
      old_tail = node.tail
      old_data = node.data
      node.data = data
      node.tail = create_node(old_data, old_tail)
    else
      count += 1
      insert(index, data, count, node.tail)
    end
  end

  def pop(node = header)
    if node.tail.tail == nil
      pops = node.tail
      node.tail = nil
      return pops
    elsif node.tail == nil
      pops = node
      node = nil
      return pops
    else
      pop(node.tail)
    end
  end

  def count(node = header, count = 0)
    count += 1
    if node.tail == nil
      return count
    else
      count(node.tail, count)
    end
  end

  private

  def create_node(data, tail)
    Node.new(data, tail)
  end

  def find_end(node = header)
    if node.tail == nil
      return node
    else
      find_end(node.tail)
    end
  end

  class Node
    attr_accessor :tail, :data
    def initialize(data_point, tailer)
      @tail = tailer
      @data = data_point
    end
  end

end
