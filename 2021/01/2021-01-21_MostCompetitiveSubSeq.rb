# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/581/week-3-january-15th-january-21st/3611/

# Find the Most Competitive Subsequence

# Given an integer array nums and a positive integer k, return the most
# competitive subsequence of nums of size k.

# An array's subsequence is a resulting sequence obtained by erasing some
# (possibly zero) elements from the array.

# We define that a subsequence a is more competitive than a subsequence b
# (of the same length) if in the first position where a and b differ,
# subsequence a has a number less than the corresponding number in b.
# For example, [1,3,4] is more competitive than [1,3,5] because the first
# position they differ is at the final number, and 4 is less than 5.
require "byebug"
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def most_competitive(nums, k)
  stack = []

  nums.each_with_index do |num, idx|
    debugger
    min_stack_len = [0, k - nums.size + idx].max
    stack.pop while stack.size > min_stack_len && num < stack.last
    stack.push(num)
  end
  return stack[0...k]
end

# Example 1:

# Input:
nums = [3, 5, 2, 6]
k = 2
# Output: [2,6]
puts most_competitive(nums, k)
# Explanation: Among the set of every possible subsequence: {[3,5], [3,2], [3,6], [5,2], [5,6], [2,6]}, [2,6] is the most competitive.

# Example 2:

# Input:
nums = [2, 4, 3, 3, 5, 4, 9, 6]
k = 4
# Output: [2,3,3,4]
puts most_competitive(nums, k)

# Constraints:

#     1 <= nums.length <= 105
#     0 <= nums[i] <= 109
#     1 <= k <= nums.length
