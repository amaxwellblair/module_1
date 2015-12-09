$LOAD_PATH.unshift("~/turing/1module/bst/lib/")  # => ["~/turing/1module/bst/lib/", "/Users/maxwell/.rvm/gems/ruby-2.2.1/gems/seeing_is_believing-3.0.0.beta.6/lib", "/Users/maxwell/.rvm/gems/ruby-2.2.1/gems/seeing_is_believing-3.0.0.beta.6/lib", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/x86_64-darwin14", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/vendor_ruby/2.2.0", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/vendor_ruby/2.2.0/x86_64-darwin14", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/vendor_ruby", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0", "/Users/maxwell/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/x86_64-darwin14"]

require 'pry'  # => true

class BinarySearchTree
  attr_accessor :rootie, :type  # => nil

  def initialize
    @rootie = nil  # => nil
  end              # => :initialize

  def insert(data, node = rootie)
    if empty?                                   # => true, false
      @rootie = create_node(data)               # => #<struct Struct::Node data=2, left=nil, right=nil>
      @type = data.class                        # => Fixnum
    elsif not_type?(data)                       # => false
      # raise StandardError.new("Data inserted is of a different type")
      puts "Data inserted is a different type"
    elsif include?(data)                        # => false
      # raise StandardError.new("Data inserted already on tree")
      puts "Data inserted already on tree"
    else
      if node.data > data                       # => true
        insert_left(data, node)                 # => #<struct Struct::Node data=1, left=nil, right=nil>
      elsif node.data < data
        insert_right(data, node)
      end                                       # => #<struct Struct::Node data=1, left=nil, right=nil>
    end                                         # => Fixnum, #<struct Struct::Node data=1, left=nil, right=nil>
  end                                           # => :insert

  def include?(data, node = rootie)
    if prep_check?(data)                           # => nil
      return nil
    elsif
      node.data == data                            # => false
      return true
    elsif node.data > data && !empty?(node.left)   # => false
      include?(data, node.left)
    elsif node.data < data && !empty?(node.right)  # => false
      include?(data, node.right)
    else
      return false                                 # => false
    end
  end                                              # => :include?

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
  end                                              # => :depth_of

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
  end                                                # => :sort

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
  end                                                             # => :load

  def leaves(node = rootie, count = 0)
    if empty?(rootie)                                # => false, false
      return nil
    elsif !empty?(node.left) || !empty?(node.right)  # => true, false
      if !empty?(node.left)                          # => true
        leaves(node.left, count)                     # => 1
      end                                            # => 1
      if !empty?(node.right)                         # => false
        leaves(node.right, count)
      end                                            # => nil
    else
      count += 1                                     # => 1
    end
    count                                            # => 1, 0
  end                                                # => :leaves

  def root
    rootie.data
  end            # => :root

  def max
    max_node.data
  end              # => :max

  def min
    min_node.data
  end              # => :min

  private  # => BinarySearchTree

  def prep_check?(data)
    if empty?              # => false
      return true
    elsif not_type?(data)  # => false
      return true
    end
  end                      # => :prep_check?

  def empty?(node = rootie)
    node == nil ? true : false  # => true, false, false, true, true, false, false, false, false, true, true, true
  end                           # => :empty?

  def max_node(node = rootie)
    if empty?(node.right)
      return node
    else
      max_node(node.right)
    end
  end                          # => :max_node

  def min_node(node = rootie)
    if empty?(node.left)
      return node
    else
      min_node(node.left)
    end
  end                          # => :min_node


  def insert_left(data, node)
    if empty?(node.left)             # => true
      node.left = create_node(data)  # => #<struct Struct::Node data=1, left=nil, right=nil>
    else
      insert(data, node.left)
    end                              # => #<struct Struct::Node data=1, left=nil, right=nil>
  end                                # => :insert_left

  def insert_right(data, node)
    if empty?(node.right)
      node.right = create_node(data)
    else
      insert(data, node.right)
    end
  end                                 # => :insert_right

  def not_type?(data)
    data.class != type ? true : false  # => false, false
  end                                  # => :not_type?


  Struct.new("Node", :data, :left, :right)  # => Struct::Node

  def create_node(data, left = nil, right = nil)
    Struct::Node.new(data, left, right)           # => #<struct Struct::Node data=2, left=nil, right=nil>, #<struct Struct::Node data=1, left=nil, right=nil>
  end                                             # => :create_node

end  # => :create_node


tree = BinarySearchTree.new  # => #<BinarySearchTree:0x007fda03a2c490 @rootie=nil>
tree.insert(2)               # => Fixnum
tree.insert(1)               # => #<struct Struct::Node data=1, left=nil, right=nil>
tree.leaves                  # => 0
