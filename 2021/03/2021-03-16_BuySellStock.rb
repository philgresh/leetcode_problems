# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/590/week-3-march-15th-march-21st/3674/
# Best Time to Buy and Sell Stock with Transaction Fee
# You are given an array prices where prices[i] is the price of a given stock on the ith day, 
# and an integer fee representing a transaction fee.

# Find the maximum profit you can achieve. You may complete as many transactions as you like, 
# but you need to pay the transaction fee for each transaction.

# Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

# Strategy:
# Iterate through prices
#   At each price, iterate through the remaining prices to find the best selling point
#   Decide to sell or hold, if previous is better
require 'byebug'

# @param {Integer[]} prices
# @param {Integer} fee
# @return {Integer}
def max_profit(prices, fee)
  dp = Array.new(prices.size+1).fill(0)
  cash, hold = 0, -prices[0]
  (1...prices.size).each do |i|
    sale = hold + prices[i] - fee
    cash = [cash, sale].max
    hold = [hold, cash - prices[i]].max
  end
  return cash
end

# Example 1:

# Input: 
prices = [1,3,2,8,4,9]
fee = 2
# Output: 8
puts max_profit(prices, fee)

# Explanation: The maximum profit can be achieved by:
# - Buying at prices[0] = 1
# - Selling at prices[3] = 8
# - Buying at prices[4] = 4
# - Selling at prices[5] = 9
# The total profit is ((8 - 1) - 2) + ((9 - 4) - 2) = 8.
# Example 2:

# Input: 
prices = [1,3,7,5,10,3]
fee = 3
# Output: 6
puts max_profit(prices, fee)
 

# Constraints:

# 1 < prices.length <= 5 * 104
# 0 < prices[i], fee < 5 * 104