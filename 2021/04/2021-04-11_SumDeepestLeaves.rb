# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/594/week-2-april-8th-april-14th/3704/
# Deepest Leaves Sum
# Given the root of a binary tree, return the sum of values of its deepest leaves.
 

# Strategy:
# Traverse the tree pre-order, passing down the height of the tree and a hash { [level] => sum }
#   Add the current node's value to hash[level]
# Return the last hash level's value

# Edge cases: 
# root is null => 0 , handled in helper
# root has no children => val, handled in helper
require 'byebug'
require_relative '../../DS/TreeNode.rb'
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
# @return {Integer}
def deepest_leaves_sum(root)
  sums = Hash.new(0)
  helper(root, 0, sums)
  return sums.values.last
end

def helper(root, height, sums)
  return nil if root.nil? || root.val.nil?
  debugger

  sums[height] += root.val
  helper(root.left, height+1, sums)
  helper(root.right, height+1, sums)
end

# Example 1:
# Input: 
root = TreeNode.nodify([1,2,3,4,5,nil,6,7,nil,nil,nil,nil,8])
# Output: 15
puts deepest_leaves_sum(root)


# Example 2:
# Input: 
root = TreeNode.nodify([6,7,8,2,7,1,3,9,nil,1,4,nil,nil,nil,5])
# Output: 19
puts deepest_leaves_sum(root)
 
# Constraints:

# The number of nodes in the tree is in the range [1, 104].
# 1 <= Node.val <= 100
