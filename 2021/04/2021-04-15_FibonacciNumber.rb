# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/595/week-3-april-15th-april-21st/3709/
# Fibonacci Number
# The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, 
# such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,

# F(0) = 0, F(1) = 1
# F(n) = F(n - 1) + F(n - 2), for n > 1.
# Given n, calculate F(n).

# @param {Integer} n
# @return {Integer}
# def fib(n)
#   prev = { 0 => 0, 1 => 1 }
#   return helper(n, prev)
# end

# def helper(n, prev)
#   return prev[n] if prev[n]

#   n_1 = helper(n-1, prev)
#   prev[n-1] = n_1
#   n_2 = helper(n-2, prev)
#   prev[n-2] = n_2
#   result = n_1 + n_2
#   prev[n] = result
#   return result
# end

def fib(n)
  prev = { 0 => 0, 1 => 1 }

  (2..n).each do |i|
    prev[i] = prev[i-1] + prev[i-2]
  end
  return prev[n]
end
# Example 1:

# Input: 
n = 2
# Output: 1
puts fib(n)
# Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.

# Example 2:
# Input: 
n = 3
# Output: 2
puts fib(n)
# Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.

# Example 3:
# Input: 
n = 4
# Output: 3
puts fib(n)
 
# Example 4:
# Input: 
n = 5
# Output: 5
puts fib(n)
 
# Example 5:
# Input: 
n = 6
# Output: 8
puts fib(n)
 

# Constraints:

# 0 <= n <= 30