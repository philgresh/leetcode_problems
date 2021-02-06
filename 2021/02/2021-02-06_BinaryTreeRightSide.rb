# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/584/week-1-february-1st-february-7th/3630/
# Binary Tree Right Side View

# Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
require_relative "../../DS/TreeNode.rb"
require "byebug"
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
# @return {Integer[]}
def right_side_view(root)
  # Reverse pre-order traversal: starting with root.right
  # Set root.val at depth if not already in results hash
  # Return results.to_a

  # Edge cases:
  #   Root.nil? => []
  #   Only (1) right val, rest in left => need to remember depth

  results = Hash.new
  right_side_view_helper(root, results, 0)
  results.values
end

def right_side_view_helper(root, results, depth)
  return if root.nil?

  results[depth] = root.val unless results[depth]
  right_side_view_helper(root.right, results, depth + 1)
  right_side_view_helper(root.left, results, depth + 1)
end

# Example:

# Input:
nodes = TreeNode.nodify([1, 2, 3, nil, 5, nil, 4])
root = nodes[0]
# Output: [1, 3, 4]
puts right_side_view(root).to_a
# Explanation:

#    1            <---
#  /   \
# 2     3         <---
#  \     \
#   5     4       <---
