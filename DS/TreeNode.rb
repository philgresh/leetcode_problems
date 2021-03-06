class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  def self.nodify(arr)
    nodes = arr.map { |v| TreeNode.new(v) }
    nodes.each.with_index do |node, i|
      node.left = nodes[2 * i + 1]
      node.right = nodes[2 * i + 2]
    end
    return nodes.first
  end

  def print_chain
    # TODO: Print binary tree from this node
  end

  def to_s
    right_val = @right.nil? ? "nil" : @right.val
    left_val = @left.nil? ? "nil" : @left.val
    "<TreeNode: @val: #{@val} @left.val: #{left_val} @right.val: #{right_val} />"
  end

  def inspect
    self.to_s
  end
end
