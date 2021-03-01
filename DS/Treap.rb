# https://github.com/nakedmoon/treap/blob/master/treap.rb

#####################################################################################
# A treap is a binary search tree with a modified way of ordering the nodes.
# As usual, each node in the tree has a key value key .
# In addition, we assign priority , which is a random number chosen independently for each node.
# We assume that all priorities are distinct and also that all keys are distinct.
# The nodes of the treap are ordered so that the keys obey the binary-search-tree property
# and the priorities obey the min-heap order property:
# if V is the left child of U, then key[V] < key[U]
# if V is the right child of U, then key[V] > key[U]
# if V is a child of U, then priority[V] > priority[U]
# The time complexity is log(n) for insert, find and delete
#####################################################################################

# The domain of the input_data is a set of comparable elements with a = >= <= and <=> operators
# If not the built in sort algorithm does not work because it can't be compare two elements
# With the given initialize method, it seems be a likely condition


class Treap

  # The number of keys same value returned by Treap#length.
  attr_reader :size

  def initialize(*values)
    @tree, @size = nil, 0
    values.flatten.uniq.each{ |v| self.add(v) }
  end

  # prepare node for insert
  # we can set priority for testing the correct
  # tree structure
  def add(value, priority = nil)
    @tree = insert(@tree, Node.new(value, priority || generate_priority))
    @size += 1
    return value
  end

  # Check if value is on the treap
  def include?(value)
    node = @tree
    while !node.nil?
      if node.key > value
        node = node.left
      elsif node.key < value
        node = node.right
      elsif node.key == value
        return true
      end
    end
    false
  end

  # Access the value as a Hashtable
  # A Treap value finder
  def [](value)
    node = @tree
    while !node.nil?
      if node.key > value
        node = node.left
      elsif node.key < value
        node = node.right
      elsif node.key == value
        return node
      end
    end
    nil
  end


  # Deletes all values stored in the Treap.
  def clear
    @tree = nil
    @size = 0
    return self
  end

  # Deletes a value
  def delete(value)
    old, @tree = remove @tree, value
    return old
  end

  def each(order = :ascending)

    stack = []
    node = @tree
    build_order = (order == :ascending) ? :left : :right
    stack_order = (order == :ascending) ? :right : :left

    while node != nil
      stack << node
      node = node.send(build_order)
    end

    while !stack.empty?
      node = stack.last
      if node.send(stack_order) == nil
        tmp = stack.pop
        while !stack.empty? and stack.last.send(stack_order) == tmp
          tmp = stack.pop
        end
      else
        tmp = node.send(stack_order)
        while !tmp.nil?
          stack << tmp
          tmp = tmp.send(build_order)
        end
      end

      yield node
    end


  end

  def length
    @size
  end



  private

  # Do a usual binary tree insert into a empty leaf
  # then we have a valid binary tree leaf
  # so, we need to check for a valid heap
  # move by rotating , instead of exchanging
  # parent and node, as in normal binary heap
  def insert(tree, node)
    return node if tree == nil # first node, root
    if node.key < tree.key # if node is the left child of tree, then node.key < tree.key
      tree.left = insert(tree.left, node)
      # if tree is a child of tree.left, then tree.priority > tree.left.priority
      tree = tree.rotate_right if tree.priority > tree.left.priority
    elsif node.key > tree.key # if node is the right child of tree, then node.key > tree.key
      tree.right = insert(tree.right, node)
      # if tree is a child of tree.right, then tree.priority > tree.right.priority
      tree = tree.rotate_left if tree.priority > tree.right.priority
    else
      # key already present # node.key = tree.key
      # we need to decrement the @size just incremented
      node.priority += 1
      @size -= 1
    end
    return tree
  end

  def remove(tree, value)
    return [nil, nil] if tree == nil
    old = nil
    if value < tree.key
      old, tree.left = remove(tree.left, value)
    elsif value > tree.key
      old, tree.right = remove(tree.right, value)
    else
      old = tree.key
      tree = tree.pop_root
      @size -= 1
    end
    return [old, tree]
  end

  # generate random priority
  def generate_priority
    int_max = 2 ** (1.size * 8)
    rand(int_max)
  end


end


class Node
  attr_accessor :key, :left, :right, :priority

  def initialize(key, priority)
    @key, @priority = key, priority
    @right, @left = nil, nil
  end

  # Rotate the tree to the right.  Returns the rotated tree.
  def rotate_right
    tmp, @left, tmp.right = @left, @left.right, self
    return tmp
  end

  # Rotate the tree to the left.  Returns the rotated tree.
  def rotate_left
    tmp, @right, tmp.left = @right, @right.left, self
    return tmp
  end

  # Delete the root node of the tree.  Returns the updated tree.
  def pop_root
    return @right if @left == nil
    return @left if @right == nil
    tmp = nil
    if @left.priority >= @right.priority
      tmp = rotate_left
      tmp.left = pop_root
    else
      tmp = rotate_right
      tmp.right = pop_root
    end
    return tmp
  end


  def to_s
    print
  end

  def print(level = 0)
    desc = ""
    desc << "#{@left.print(level + 1)}-" unless @left.nil?
    #desc << "#" * level
    desc << "[#{@key}, #{@priority}]"
    desc << "-#{@right.print(level + 1)}" unless @right.nil?
    return desc
  end
end