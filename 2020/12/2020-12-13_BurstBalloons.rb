# https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/570/week-2-december-8th-december-14th/3564/
# Given n balloons, indexed from 0 to n-1. Each balloon is painted with a number on it represented by array nums. You are asked to burst all the balloons. If the you burst balloon i you will get nums[left] * nums[i] * nums[right] coins. Here left and right are adjacent indices of i. After the burst, the left and right then becomes adjacent.

# Find the maximum coins you can collect by bursting the balloons wisely.

# Note:

#     You may imagine nums[-1] = nums[n] = 1. They are not real therefore you can not burst them.
#     0 ≤ n ≤ 500, 0 ≤ nums[i] ≤ 100

# @param {Integer[]} nums
# @return {Integer}
# def max_coins(nums)
#   ext = [1, *nums, 1]
#   n = nums.size
#   dp = Array.new(n + 2) { Array.new(n + 2).fill(0) }

#   return calc(dp, nums, 0, n - 1)
# end

# def calc(dp, nums, i, j)
#   return dp[i][j] if dp[i][j] || j == i + 1
#   coins = 0
#   (i + 1...j).each { |k|
#     coins = [
#       coins,
#       nums[i] * nums[k] * nums[j] + calc(dp, nums, i, k) + calc(dp, nums, k, j),
#     ].max
#   }
#   dp[i][j] = coins
#   return coins
# end



# Example:

# Input:
nums = [3, 1, 5, 8]
# Output: 167
puts max_coins(nums)
# Explanation: nums = [3,1,5,8] --> [3,5,8] -->   [3,8]   -->  [8]  --> []
#              coins =  3*1*5      +  3*5*8    +  1*3*8      + 1*8*1   = 167
