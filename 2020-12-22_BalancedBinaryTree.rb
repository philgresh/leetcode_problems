# https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/572/week-4-december-22nd-december-28th/3577/
# Balanced Binary Tree

# Given a binary tree, determine if it is height-balanced.

# For this problem, a height-balanced binary tree is defined as:

#     a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

# Constraints:

#     The number of nodes in the tree is in the range [0, 5000].
#     -10^4 <= Node.val <= 10^4

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
# @return {Boolean}
def is_balanced(root)
  return true if root.nil? || (root.left.nil? && root.right.nil?)
  return is_balanced_helper(root) >= 0
end

def is_balanced_helper(root)
  return 0 if root.nil?

  left = is_balanced_helper(root.left)
  return -1 if left == -1
  right = is_balanced_helper(root.right)

  return -1 if right == -1 || (left-right).abs > 1
  return [left, right].max + 1
end
