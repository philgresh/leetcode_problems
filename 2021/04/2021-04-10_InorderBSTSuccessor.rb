# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/594/week-2-april-8th-april-14th/3700/
# Inorder Successor in BST
# Given the root of a binary search tree and a node p in it, return the in-order successor of that 
# node in the BST. If the given node has no in-order successor in the tree, return null.

# The successor of a node p is the node with the smallest key greater than p.val.
require_relative '../../DS/TreeNode.rb'
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end
require 'byebug'
# @param {TreeNode} root
# @param {TreeNode} p
# @return {TreeNode}
def inorder_successor(root, p)
  successor = nil
        
  while root
    if p.val >= root.val
      root = root.right
    else
      successor = root
      root = root.left
    end
  end
  return successor
end

# Example 1:


# Input: 
root = [2,1,3]
p = 1
# Output: 2
puts inorder_successor(TreeNode.nodify(root), TreeNode.nodify(p)[0])
# Explanation: 1's in-order successor node is 2. Note that both p and the return value is of TreeNode type.


# Example 2:
# Input: 
root = [5,3,6,2,4,nil,nil,1]
p = 6
# Output: nil
puts inorder_successor(TreeNode.nodify(root), TreeNode.nodify(p)[0])
# Explanation: There is no in-order successor of the current node, so the answer is null.
 

# Constraints:

# The number of nodes in the tree is in the range [1, 104].
# -105 <= Node.val <= 105
# All Nodes will have unique values.