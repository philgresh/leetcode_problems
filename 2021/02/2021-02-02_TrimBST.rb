# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/584/week-1-february-1st-february-7th/3626/

# Trim a Binary Search Tree

# Given the root of a binary search tree and the lowest and highest boundaries as low and high, trim the tree so that all its elements lies in [low, high]. Trimming the tree should not change the relative structure of the elements that will remain in the tree (i.e., any node's descendant should remain a descendant). It can be proven that there is a unique answer.

# Return the root of the trimmed binary search tree. Note that the root may change depending on the given bounds.

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
# @param {Integer} low
# @param {Integer} high
# @return {TreeNode}
def trim_bst(root, low, high)
  return root if !root
  return trim_bst(root.left, low, high) if root.val > high
  return trim_bst(root.right, low, high) if root.val < low
  
  root.left = trim_bst(root.left, low, high)
  root.right = trim_bst(root.right, low, high)
  return root
end

# Example 1:

# Input:
root = [1, 0, 2]
low = 1
high = 2
# Output: [1,null,2]
puts trim_bst(root, low, high)

# Example 2:

# Input:
root = [3, 0, 4, null, 2, null, null, 1]
low = 1
high = 3
# Output: [3,2,null,1]
puts trim_bst(root, low, high)

# Example 3:

# Input:
root = [1]
low = 1
high = 2
# Output: [1]
puts trim_bst(root, low, high)

# Example 4:

# Input:
root = [1, null, 2]
low = 1
high = 3
# Output: [1,null,2]
puts trim_bst(root, low, high)

# Example 5:

# Input:
root = [1, null, 2]
low = 2
high = 4
# Output: [2]
puts trim_bst(root, low, high)

# Constraints:

#     The number of nodes in the tree in the range [1, 104].
#     0 <= Node.val <= 104
#     The value of each node in the tree is unique.
#     root is guaranteed to be a valid binary search tree.
#     0 <= low <= high <= 104
