# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/587/week-4-february-22nd-february-28th/3654/
# Divide Two Integers

# Given two integers dividend and divisor, divide two integers without using multiplication, division, and mod operator.

# Return the quotient after dividing dividend by divisor.

# The integer division should truncate toward zero, which means losing its fractional part. For example, truncate(8.345) = 8 and truncate(-2.7335) = -2.

# Note:

#     Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For this problem, assume that your function returns 231 − 1 when the division result overflows.
require 'byebug'

# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
  sign = 1
  sign = -1 if (dividend < 0) ^ (divisor < 0)

  dividend = dividend.abs
  divisor = divisor.abs

  quotient = 0
  temp = 0
  31.downto(0).each do |i|
    if temp + (divisor << i) <= dividend
      temp += divisor << i
      quotient |= 1 << i
    end
  end
  result = sign * quotient
  return 2**31-1 if result >= 2**31
  return result
end

# Example 1:

# Input: 
dividend = 10
divisor = 3
# Output: 3
puts divide(dividend, divisor)
# Explanation: 10/3 = truncate(3.33333..) = 3.

# Example 2:

# Input: 
dividend = 7
divisor = -3
# Output: -2
puts divide(dividend, divisor)
# Explanation: 7/-3 = truncate(-2.33333..) = -2.

# Example 3:

# Input: 
dividend = 0
divisor = 1
puts divide(dividend, divisor)
# Output: 0

# Example 4:

# Input: 
dividend = 1
divisor = 1
puts divide(dividend, divisor)
# Output: 1

 
# Example 5:

# Input: 
dividend =-2147483648
divisor = -1
puts divide(dividend, divisor)
# Output: 2147483647

 

# Constraints:

#     -2^31 <= dividend, divisor <= 2^31 - 1
#     divisor != 0

