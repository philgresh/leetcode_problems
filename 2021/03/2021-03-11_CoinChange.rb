# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/589/week-2-march-8th-march-14th/3668/
# Coin Change
# You are given coins of different denominations and a total amount of money amount. 
# Write a function to compute the fewest number of coins that you need to make up that amount. 
# If that amount of money cannot be made up by any combination of the coins, return -1.

# You may assume that you have an infinite number of each kind of coin.

# Strategy:
# Create dp array from 0 to n, fill with Infinity
# Iterate over coins:
#   Iterate over dp, taking the min of each bucket if we can make better change with this coin
# Return dp.last, or -1

# Time complexity: O(|coins| * amount)
# Space complexity: O(amount)

# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
  dp = Array.new(amount+1).fill(Float::INFINITY)
  dp[0] = 0

  coins.each do |coin|
    (coin..amount).each do |x|
      dp[x] = [dp[x], dp[x - coin] + 1].min
    end 
  end
  return dp.last == Float::INFINITY ? -1 : dp.last
end

# Example 1:

# Input: 
coins = [1,2,5]
amount = 11
# Output: 3
# Explanation: 11 = 5 + 5 + 1
puts coin_change(coins, amount)

# Example 2:

# Input: 
coins = [2]
amount = 3
# Output: -1
puts coin_change(coins, amount)

# Example 3:

# Input: 
coins = [1]
amount = 0
# Output: 0
puts coin_change(coins, amount)

# Example 4:

# Input: 
coins = [1]
amount = 1
# Output: 1
puts coin_change(coins, amount)

# Example 5:

# Input: 
coins = [1]
amount = 2
# Output: 2
puts coin_change(coins, amount)


# Constraints:

# 1 <= coins.length <= 12
# 1 <= coins[i] <= 231 - 1
# 0 <= amount <= 104