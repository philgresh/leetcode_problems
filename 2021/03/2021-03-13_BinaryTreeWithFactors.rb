# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/589/week-2-march-8th-march-14th/3670/
# Binary Trees With Factors

# Given an array of unique integers, arr, where each integer arr[i] is strictly greater than 1.

# We make a binary tree using these integers, and each number may be used for any number of times. Each non-leaf 
# node's value should be equal to the product of the values of its children.

# Return the number of binary trees we can make. The answer may be too large so return the answer modulo 109 + 7.
require 'byebug'
MOD = 10**9 + 7
# @param {Integer[]} arr
# @return {Integer}
def num_factored_binary_trees(arr)
  n = arr.size
  arr.sort!
  dp = Array.new(n).fill(1)
  index = {}
  arr.each.with_index { |ele, i| index[ele] = i }

  arr.each.with_index do |ele, i|
    (0...i).each do |j|
      if ele % arr[j] == 0
        right = ele / arr[j]
        if index[right]
          dp[i] += dp[j] * dp[index[right]]
          dp[i] %= MOD
        end
      end
    end
  end
  return dp.sum % MOD
end

# Example 1:

# Input: 
arr = [2,4]
# Output: 3
puts num_factored_binary_trees(arr)
# Explanation: We can make these trees: [2], [4], [4, 2, 2]

# Example 2:

# Input: 
arr = [2,4,5,10]
# Output: 7
puts num_factored_binary_trees(arr)
# Explanation: We can make these trees: [2], [4], [5], [10], [4, 2, 2], [10, 2, 5], [10, 5, 2].

# Constraints:

#     1 <= arr.length <= 1000
#     2 <= arr[i] <= 10**9

