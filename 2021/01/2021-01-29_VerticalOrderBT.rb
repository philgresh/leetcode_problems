# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/583/week-5-january-29th-january-31st/3621/

# Vertical Order Traversal of a Binary Tree

# Given the root of a binary tree, calculate the vertical order traversal of the binary tree.

# For each node at position (x, y), its left and right children will be at positions (x - 1, y - 1) and (x + 1, y - 1) respectively.

# The vertical order traversal of a binary tree is a list of non-empty reports for each unique x-coordinate from left to right. Each report is a list of all nodes at a given x-coordinate. The report should be primarily sorted by y-coordinate from highest y-coordinate to lowest. If any two nodes have the same y-coordinate in the report, the node with the smaller value should appear earlier.

# Return the vertical order traversal of the binary tree.
require "byebug"
require "test/unit/assertions"
require_relative '../../DS/ListNode.rb'

include Test::Unit::Assertions

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def vertical_traversal(root)
  # Set up columns (hash with keys of X-coordinates, values of arrays of Y-coordinates)
  # In-order traverse, pushing down columns obj and current coords
  # Push in root.val
  columns = Hash.new { |h, k| h[k] = Hash.new { |h,k| h[k] = [] } }
  vertical_traversal_helper(root, columns, 0, 0)
  order_columns(columns)
end

def vertical_traversal_helper(root, columns, x, y)
  return if root.nil?
  vertical_traversal_helper(root.left, columns, x - 1, y + 1)
  columns[x][y] << root.val
  vertical_traversal_helper(root.right, columns, x + 1, y + 1)
end

def order_columns(columns)
  result = []
  columns.each { |_, val| result << val }
  return result
end

# Example 1:

# Input:
root = ListNode::nodify([3, 9, 20, nil, nil, 15, 7])
expected = [[9], [3, 15], [20], [7]]
actual = vertical_traversal(root)
assert_equal(
  expected,
  actual,
  failure_message = "Expected: #{expected}, got: #{actual}"
)
# Explanation: Without loss of generality, we can assume the root node is at position (0, 0):
# The node with value 9 occurs at position (-1, -1).
# The nodes with values 3 and 15 occur at positions (0, 0) and (0, -2).
# The node with value 20 occurs at position (1, -1).
# The node with value 7 occurs at position (2, -2).

# Example 2:

# Input:
root = ListNode::nodify([1, 2, 3, 4, 5, 6, 7])
expected = [[4], [2], [1, 5, 6], [3], [7]]
actual = vertical_traversal(root)
assert_equal(
  expected,
  actual,
  failure_message = "Expected: #{expected}, got: #{actual}"
)
# Explanation: The node with value 5 and the node with value 6 have the same position according to the given scheme.
# However, in the report [1,5,6], the node with value 5 comes first since 5 is smaller than 6.

# Example 3:

# Input:
root = ListNode::nodify([1])
expected = [[1]]
actual = vertical_traversal(root)
assert_equal(
  expected,
  actual,
  failure_message = "Expected: #{expected}, got: #{actual}"
)

# Constraints:

#     The number of nodes in the tree is in the range [1, 1000].
#     0 <= Node.val <= 1000
