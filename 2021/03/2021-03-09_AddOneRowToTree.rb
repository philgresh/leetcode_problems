# # https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/589/week-2-march-8th-march-14th/3666/
# Add One Row to Tree
# Given the root of a binary tree, then value v and depth d, you need to add a 
# row of nodes with value v at the given depth d. The root node is at depth 1.

# The adding rule is: given a positive integer depth d, for each NOT null tree 
# nodes N in depth d-1, create two tree nodes with value v as N's left subtree 
# root and right subtree root. And N's original left subtree should be the left 
# subtree of the new left subtree root, its original right subtree should be the 
# right subtree of the new right subtree root. If depth d is 1 that means there 
# is no depth d-1 at all, then create a tree node with value v as the new root 
# of the whole original tree, and the original tree is the new root's left 
# subtree.

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
# @param {Integer} v
# @param {Integer} d
# @return {TreeNode}
def add_one_row(root, v, d)
  if d == 1
    n = TreeNode.new(v)
    n.left = root
    return n
  end

  qu = []
  qu << root
  depth = 1
  while depth < d-1
    temp = []
    until qu.empty?
      node = qu.shift
      temp << node.left if node.left && node.left.val
      temp << node.right if node.right && node.right.val
    end
    qu = temp
    depth += 1
  end

  until qu.empty?
    node = qu.shift
    temp = node.left
    node.left = TreeNode.new(v)
    node.left.left = temp
    temp = node.right
    node.right = TreeNode.new(v)
    node.right.right = temp
  end
  return root
end

# Example 1:
# Input: 
# A binary tree as following:
#        4
#      /   \
#     2     6
#    / \   / 
#   3   1 5   

# v = 1

# d = 2

# Output: 
#        4
#       / \
#      1   1
#     /     \
#    2       6
#   / \     / 
#  3   1   5   

# Example 2:
# Input: 
# A binary tree as following:
#       4
#      /   
#     2    
#    / \   
#   3   1    

# v = 1

# d = 3

# Output: 
#       4
#      /   
#     2
#    / \    
#   1   1
#  /     \  
# 3       1
# Note:
# The given d is in range [1, maximum depth of the given tree + 1].
# The given binary tree has at least one tree node.