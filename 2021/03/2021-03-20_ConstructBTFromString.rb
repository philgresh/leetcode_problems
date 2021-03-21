# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/590/week-3-march-15th-march-21st/3672/
# Construct Binary Tree from String
# You need to construct a binary tree from a string consisting of parenthesis and integers.

# The whole input represents a binary tree. It contains an integer followed by zero, one or two pairs of parenthesis. 
# The integer represents the root's value and a pair of parenthesis contains a child binary tree with the same structure.

# You always start to construct the left child node of the parent first if it exists.

# Strategy:
# Recursive = base case is that s is an empty string
# 

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
# @param {String} s
# @return {TreeNode}
def str2tree(s)
  return helper(s, 0)[0]
end

def helper(s, i)
  return [nil, i] if i == s.size
  value, i = get_number(s, i)
  node = TreeNode.new(value)

  if i < s.size && s[i] == '('
    node.left, i = helper(s, i + 1)
  end
  if node.left != nil && i < s.size && s[i] == '('
    node.right, i = helper(s, i + 1)
  end
  final_i = i < s.size && s[i] == ')' ? i + 1 : i
  return [node, final_i]
end

def get_number(s, i)
  is_neg = false
  if s[i] == '-'
    is_neg= true
    i += 1
  end
  number = 0
  while i < s.size && s[i].match?(/\d/)
    number *= 10
    number += s[i].to_i
    i += 1
  end
  number *= -1 if is_neg
  return [number, i]
end


# @param {String} s
# @return {TreeNode}
# def str2tree(s)
#   return nil if s.empty?
#   i = s.index(/\(/)
#   val = (s[0...i])
#   root = TreeNode.new(val)
#   next_i = find_enclosing_parens(s, i)
#   left = s[i+1...next_i]
#   root.left = str2tree(left)
#   right = s[next_i+2...s.size-1]
# end

# def find_enclosing_parens(s, i)
#   stack = []
#   while i < s.size
#     if s[i] == "("
#       stack << "("
#     elsif s[i] == ")"
#       stack.pop
#     end
#     break if stack.empty?
#     i += 1
#   end
#   return i
# end

# Example 1:


# Input: 
s = "4(2(3)(1))(6(5))"
# Output: [4,2,6,3,1,5]
puts str2tree(s)

# Example 2:

# Input: 
s = "4(2(3)(1))(6(5)(7))"
# Output: [4,2,6,3,1,5,7]
puts str2tree(s)

# Example 3:

# Input: 
s = "-4(2(3)(1))(6(5)(7))"
# Output: [-4,2,6,3,1,5,7]
puts str2tree(s)

 

# Constraints:

# 0 <= s.length <= 3 * 104
# s consists of digits, '(', ')', and '-' only.