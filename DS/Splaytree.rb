# https://github.com/SnowDiamond/splaytree/blob/master/lib/splaytree/version.rb
class Splaytree
  VERSION = '0.3.0'
end

class Splaytree
  class Node
    include Comparable

    attr_reader :key
    attr_accessor :value, :left, :right, :parent, :duplicates

    def initialize(key, value = nil, parent = nil, left = nil, right = nil)
      @key = key
      @value = value
      @parent = parent
      @left = left
      @right = right
      @duplicates = []
    end

    def add_duplicate!(value)
      @duplicates.push(@value)
      @value = value
    end

    def remove_duplicate!
      return if @duplicates.empty?
      deleted = @value
      @value = @duplicates.pop
      deleted
    end

    def duplicates?
      !@duplicates.empty?
    end

    def root?
      parent.nil?
    end

    def parent_root?
      parent && parent.root?
    end

    def gparent
      parent && parent.parent
    end

    def set_left(node)
      @left = node
      return unless node
      node.parent = self
    end

    def set_right(node)
      @right = node
      return unless node
      node.parent = self
    end

    def rotate
      parent = self.parent
      gparent = self.gparent
      if gparent
        if parent.object_id == gparent.left.object_id
          gparent.set_left(self)
        else
          gparent.set_right(self)
        end
      else
        self.parent = nil
      end

      if object_id == parent.left.object_id
        parent.set_left(right)
        set_right(parent)
      else
        parent.set_right(left)
        set_left(parent)
      end
    end

    def zigzig?
      (object_id == parent.left.object_id && parent.object_id == gparent.left.object_id) ||
        (object_id == parent.right.object_id && parent.object_id == gparent.right.object_id)
    end

    def to_s
      key.to_s
    end

    def to_h
      { key => value }
    end
    alias_method :to_hash, :to_h

    def to_a
      [key, value]
    end

    def <=>(other)
      return unless other
      key <=> other.key
    end

  end
end

class Splaytree
  include Enumerable

  attr_reader :root, :size
  alias_method :length, :size

  def initialize
    @root = nil
    @size = 0
  end

  def empty?
    @root.nil?
  end

  def key?(key)
    !!get(key)
  end

  def higher(key)
    return if empty?
    get(key)
    return @root.to_h if @root.key > key
    get_one_higher_of_root
  end

  def lower(key)
    return if empty?
    get(key)
    return @root.to_h if @root.key < key
    get_one_lower_of_root
  end

  def ceiling(key)
    return if empty?
    get(key)
    return @root.to_h if @root.key >= key
    get_one_higher_of_root
  end

  def floor(key)
    return if empty?
    get(key)
    return @root.to_h if @root.key <= key
    get_one_lower_of_root
  end

  def min
    return if empty?
    node = @root
    node = node.left while node.left
    splay(node)
    node.to_h
  end

  def max
    return if empty?
    node = @root
    node = node.right while node.right
    splay(node)
    node.to_h
  end


  def height
    subtree_height = -> (node) do
      return 0 unless node
      left = 1 + subtree_height.call(node.left)
      right = 1 + subtree_height.call(node.right)
      left > right ? left : right
    end
    subtree_height.call(@root)
  end

  def duplicates(key)
    return if empty?
    get(key)
    return if @root.key != key
    @root.duplicates + [@root.value]
  end

  def get(key)
    return if empty?
    node = @root
    value = nil
    loop do
      case key <=> node.key
      when 0
        value = node.value
        break
      when -1
        break if node.left.nil?
        node = node.left
      when 1
        break if node.right.nil?
        node = node.right
      else
        raise TypeError, 'Keys should be comparable!'
      end
    end
    splay(node)
    value
  end
  alias_method :[], :get

  def insert(key, value)
    node = Node.new(key, value)
    if @root
      current = @root
      loop do
        case key <=> current.key
        when 0
          node = current
          node.add_duplicate!(value)
          break
        when -1
          unless current.left
            current.set_left(node)
            break
          end
          current = current.left
        when 1
          unless current.right
            current.set_right(node)
            break
          end
          current = current.right
        else
          raise TypeError, 'Keys should be comparable!'
        end
      end
    end
    splay(node)
    @size += 1
    true
  end
  alias_method :[]=, :insert

  def update(key, value)
    return false if empty?
    get(key)
    return false if @root.key != key
    @root.value = value
    true
  end

  def remove(key)
    return if empty?
    get(key)
    return if @root.key != key
    if @root.duplicates?
      deleted = @root.remove_duplicate!
    else
      deleted = @root.value
      if @root.left.nil?
        @root = @root.right
        @root.parent = nil
      else
        right = @root.right
        @root = @root.left
        @root.parent = nil
        get(key)
        @root.set_right(right)
      end
    end
    @size -= 1
    deleted
  end

  def clear
    @root = nil
    @size = 0
  end

  def each
    return if empty?
    stack = []
    node = @root
    loop do
      if node
        stack.push(node)
        node.duplicates.each do |value|
          stack.push(Node.new(node.key, value, node))
        end
        node = node.left
      else
        break if stack.empty?
        node = stack.pop
        yield(node)
        node = node.right
      end
    end
  end

  def each_key
    each { |node| yield node.key }
  end

  def each_value
    each { |node| yield node.value }
  end

  def keys
    to_enum(:each_key).to_a
  end

  def values
    to_enum(:each_value).to_a
  end

  def display
    print_tree = -> (node, depth) do
      return unless node
      print_tree.call(node.right, depth + 1)
      puts node.key.to_s.rjust(5*depth, ' ')
      print_tree.call(node.left, depth + 1)
    end
    print_tree.call(@root, 0)
  end

  def report
    return if empty?
    result = []
    each do |node|
      item = {
        node: node.key,
        parent: node.parent && node.parent.key,
        left: node.left && node.left.key,
        right: node.right && node.right.key
      }
      result << item
    end
    result
  end

  private

    def get_one_higher_of_root
      return if @root.right.nil?
      node = @root.right
      node = node.left while node.left
      splay(node)
      node.to_h
    end

    def get_one_lower_of_root
      return if @root.left.nil?
      node = @root.left
      node = node.right while node.right
      splay(node)
      node.to_h
    end

    def splay(node)
      until node.root?
        parent = node.parent
        if parent.root?
          node.rotate
        elsif node.zigzig?
          parent.rotate
          node.rotate
        else
          node.rotate
          node.rotate
        end
      end
      @root = node
    end
end