# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/585/week-2-february-8th-february-14th/3634/
# Convert BST to Greater Tree

# Given the root of a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus sum of all keys greater than the original key in BST.

# As a reminder, a binary search tree is a tree that satisfies these constraints:

#     The left subtree of a node contains only nodes with keys less than the node's key.
#     The right subtree of a node contains only nodes with keys greater than the node's key.
#     Both the left and right subtrees must also be binary search trees.

# Note: This question is the same as 1038: https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/
require "byebug"
require_relative "../../DS/TreeNode.rb"

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
# @return {TreeNode}
def convert_bst(root)
  return [] if root.nil? || root.val.nil?
  curr_sum = [0]

  convert_bst_helper(root.right, curr_sum) if root.right
  curr_sum[0] += root.val
  root.val = curr_sum[0]
  convert_bst_helper(root.left, curr_sum) if root.left
  return root
end

def convert_bst_helper(root, curr_sum)
  return nil if root.nil? || root.val.nil?

  if !root.left && !root.right
    curr_sum[0] += root.val
    root.val = curr_sum[0]
    return nil
  end

  convert_bst_helper(root.right, curr_sum) if root.right
  curr_sum[0] += root.val
  root.val = curr_sum[0]
  convert_bst_helper(root.left, curr_sum) if root.left
end

# Example 1:

# Input:
root = TreeNode.nodify([4, 1, 6, 0, 2, 5, 7, nil, nil, nil, 3, nil, nil, nil, 8])
# Output: [30,36,21,36,35,26,15,nil,nil,nil,33,nil,nil,nil,8]
puts convert_bst(root).to_s

# Example 2:

# Input:
root = TreeNode.nodify([0, nil, 1])
# Output: [1,nil,1]
puts convert_bst(root).to_s

# Example 3:

# Input:
root = TreeNode.nodify([1, 0, 2])
# Output: [3,3,2]
puts convert_bst(root).to_s

# Example 4:

# Input:
root = TreeNode.nodify([3, 2, 4, 1])
# Output: [7,9,4,10]
puts convert_bst(root).to_s

# Constraints:

#     The number of nodes in the tree is in the range [0, 104].
#     -104 <= Node.val <= 104
#     All the values in the tree are unique.
#     root is guaranteed to be a valid binary search tree.
