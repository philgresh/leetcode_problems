# https://leetcode.com/problems/combination-sum-iv/
# 377. Combination Sum IV
# Medium

# Given an integer array with all positive numbers and no duplicates, find the number of possible combinations that add up to a positive integer target.

# Create a 1D array of length target + 1
# Iterate through the dp array
#   For each index:
#     Set newVal at 0
#     Iterate through nums
#       If num > index, continue
#       Else add the value of dp[index-num] to newVal
#     Set index to newVal
# Return the last index (our target)
# nums: [1, 2, 3]
# idx: [0, 1, 2, 3, 4 ]
# val: [1, 1, 2, 4, 7 ]
require "byebug"
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def combination_sum4(nums, target)
  dp = Array.new(target + 1)
  dp[0] = 1

  (1..target).each do |i|
    new_val = 0
    nums.each do |num|
      debugger
      next if num > i
      new_val += dp[i - num]
    end
    dp[i] = new_val
  end
  return dp.last
end

# Example 1:

#
nums = [1, 2, 3]
target = 4

puts combination_sum4(nums, target) # 7

# The possible combination ways are:
# (1, 1, 1, 1)
# (1, 1, 2)
# (1, 2, 1)
# (1, 3)
# (2, 1, 1)
# (2, 2)
# (3, 1)

# Note that different sequences are counted as different combinations.

# Therefore the output is 7.

# Example 2:

#
nums = [2]
target = 6

puts combination_sum4(nums, target) # 1

# Follow up:
# What if negative numbers are allowed in the given array?
# How does it change the problem?
# What limitation we need to add to the question to allow negative numbers?
