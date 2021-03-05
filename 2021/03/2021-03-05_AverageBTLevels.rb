# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/588/week-1-march-1st-march-7th/3661/
# Average of Levels in Binary Tree
# Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.

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

# Strategy:
# Traverse binary tree, keeping track of level, passing down levels hash
# Return the averages

# Edge cases:
#   root.nil? => return 0

# Data structures:
# Stack (implicit) for traversing
# Hash for levels 

# Time complexity: O(n)
# Space complexity: O(log(n))

# @param {TreeNode} root
# @return {Float[]}
def average_of_levels(root)
  return 0 if root.nil?
  # levels[level] = [running_avg, count]
  levels = Hash.new { |h,k| h[k] = Array.new(2).fill(0) } 

  traverse(root, levels, 0)

  levels.values.map { |v| v[0] }  # Ruby stores hash keys in order of appearance
end

def traverse(root, levels, level)
  return if root.nil? || root.val.nil?
  
  levels[level] = calc_new_running_avg(levels, level, root.val)
  traverse(root.left, levels, level + 1)
  traverse(root.right, levels, level + 1)
end

def calc_new_running_avg(levels, level, ele)
  avg, n = levels[level]
  total = avg * n
  total += ele * 1.0
  n += 1
  avg = total / n
  levels[level] = [avg, n]
end


# Example 1:

# Input:
#     3
#    / \
#   9  20
#     /  \
#    15   7
root = TreeNode.nodify([3,9,20,nil,nil,15,7])
# Output: [3, 14.5, 11]
puts average_of_levels(root).to_s
# Explanation:
# The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].

# Note:

# The range of node's value is in the range of 32-bit signed integer.
