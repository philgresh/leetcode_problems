# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

require "byebug"

def array_to_treenode_root(arr)
  nodes = arr.map { |val| TreeNode.new(val) }
  nodes.each.with_index do |node, i|
    node.left = nodes[left_index(i)] if left_index(i) < nodes.size
    node.right = nodes[right_index(i)] if right_index(i) < nodes.size
  end
  return nodes[0]
end

def left_index(idx)
  2 * idx + 1
end

def right_index(idx)
  2 * idx + 2
end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  p_ancestors = get_ancestors(root, p)
  q_ancestors = get_ancestors(root, q)
  find_common(p_ancestors, q_ancestors)
end

def get_ancestors(root, search_val)
  return [] if root.nil? || root.val.nil?
  prev = [root.val]

  return prev if root.val == search_val

  left = get_ancestors(root.left, search_val)
  return prev.concat(left) if left.size > 0

  right = get_ancestors(root.right, search_val)
  return prev.concat(right) if right.size > 0

  return []
end

def find_common(p_ancestors, q_ancestors)
  i = 0
  p p_ancestors
  p q_ancestors
  min_length = [p_ancestors.size, q_ancestors.size].min
  (0...min_length).each do |i|
    return p_ancestors[i] if p_ancestors[i + 1] != q_ancestors[i + 1]
  end
  return nil # Shouldn't ever hit but lets us know if something's broken
end

root = array_to_treenode_root([3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4])
p = 5
q = 1
puts lowest_common_ancestor(root, p, q)

root = array_to_treenode_root([3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4])
p = 5
q = 4
puts lowest_common_ancestor(root, p, q)

root = array_to_treenode_root([1, 2])
p = 1
q = 2
puts lowest_common_ancestor(root, p, q)
