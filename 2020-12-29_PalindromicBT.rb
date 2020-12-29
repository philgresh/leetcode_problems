# https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/573/week-5-december-29th-december-31st/3585/
# Pseudo-Palindromic Paths in a Binary Tree

# Given a binary tree where node values are digits from 1 to 9. A path in the
# binary tree is said to be pseudo-palindromic if at least one permutation of
# the node values in the path is a palindrome.

# Return the number of pseudo-palindromic paths going from the root node to leaf nodes.

# Constraints:

#     The given binary tree will have between 1 and 10^5 nodes.
#     Node values are digits from 1 to 9.

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
def pseudo_palindromic_paths(root)
  @count = 0

  def get_paths(root, path)
    return if root.nil?

    new_path = [*path, root.val]

    if root.left.nil? && root.right.nil?
      @count += 1 if is_pseudopalindromic?(new_path)
      return
    end
    get_paths(root.left, new_path) if root.left
    get_paths(root.right, new_path) if root.right
  end

  get_paths(root, [])
  return @count
end

def is_pseudopalindromic?(arr)
  dict = Hash.new { |h, k| h[k] = 0 }
  arr.each do |ele|
    dict[ele] += 1
    dict.delete(ele) if dict[ele] == 2
  end
  dict.count <= 1
end

# Example 1:

# Input:
root = [2, 3, 1, 3, 1, null, 1]
# Output: 2
puts pseudo_palindromic_paths(root)
# Explanation: The figure above represents the given binary tree. There are
# three paths going from the root node to leaf nodes: the red path [2,3,3],
# the green path [2,1,1], and the path [2,3,1]. Among these paths only red path
# and green path are pseudo-palindromic paths since the red path [2,3,3] can be
# rearranged in [3,2,3] (palindrome) and the green path [2,1,1] can be rearranged
# in [1,2,1] (palindrome).

# Example 2:

# Input:
root = [2, 1, 1, 1, 3, null, null, null, null, null, 1]
# Output: 1
puts pseudo_palindromic_paths(root)

# Explanation: The figure above represents the given binary tree. There are
# three paths going from the root node to leaf nodes: the green path [2,1,1],
# the path [2,1,3,1], and the path [2,1]. Among these paths only the green
# path is pseudo-palindromic since [2,1,1] can be rearranged in [1,2,1]
(palindrome).

  # Example 3:

  # Input:
  root = [9]
# Output: 1
puts pseudo_palindromic_paths(root)
