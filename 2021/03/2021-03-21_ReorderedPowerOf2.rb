# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/590/week-3-march-15th-march-21st/3679/
# Reordered Power of 2
# Starting with a positive integer N, we reorder the digits in any order (including the original order) such that the leading digit is not zero.

# Return true if and only if we can do this in a way such that the resulting number is a power of 2.
require 'byebug'
# @param {Integer} n
# @return {Boolean}
def reordered_power_of2(n)
  count_n = count(n)
  (0...31).each do |i|
    return true if count_n == count(1 << i)
  end
  return false
end

def count(n)
  ans = Array.new(10, 0)
  while n > 0
    ans[n % 10] += 1
    n /= 10
  end
  return ans
end

# Example 1:

debugger
# Input: 
n = 1
# Output: true
puts reordered_power_of2(n)

# Example 2:
# Input: 
n = 10
# Output: false
puts reordered_power_of2(n)

# Example 3:

# Input: 
n = 16
# Output: true
puts reordered_power_of2(n)

# Example 4:

# Input: 
n = 24
# Output: false
puts reordered_power_of2(n)

# Example 5:

# Input: 
n = 46
# Output: true
puts reordered_power_of2(n)
 

# Note:

# 1 <= N <= 10^9