# https://leetcode.com/problems/climbing-stairs/
# 70. Climbing Stairs
# Easy

# You are climbing a staircase. It takes n steps to reach the top.

# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  dp = [1, 2]
  (2...n).each do |i|
    back_one = dp[i - 1]
    back_two = dp[i - 2]
    dp << back_one + back_two
  end

  return dp[n-1]
end

# Example 1:

# Input:
n = 2
# Output: 2
puts climb_stairs(n)
# Explanation: There are two ways to climb to the top.
# 1. 1 step + 1 step
# 2. 2 steps

# Example 2:

# Input:
n = 3
# Output: 3
puts climb_stairs(n)
# Explanation: There are three ways to climb to the top.
# 1. 1 step + 1 step + 1 step
# 2. 1 step + 2 steps
# 3. 2 steps + 1 step

# Constraints:

#     1 <= n <= 45
