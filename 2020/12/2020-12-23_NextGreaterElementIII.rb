# https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/572/week-4-december-22nd-december-28th/3578/

# Next Greater Element III

# Given a positive integer n, find the smallest integer which has exactly the
# same digits existing in the integer n and is greater in value than n.
# If no such positive integer exists, return -1.

# Note that the returned integer should fit in 32-bit integer, if there is a
# valid answer but it does not fit in 32-bit integer, return -1.

# Constraints:

#     1 <= n <= 231 - 1

#  @param {Integer} n
# @return {Integer}

require "byebug"

# def next_greater_element(n) # n = 1289423 => 1289432, n=21 => -1
#   return -1 if n < 10
#   digits = digitize(n)
#   original = digits.dup               # [1, 2, 8, 9, 4, 2, 3]

#   (digits.size - 1).downto(0) do |i|
#     curr = digits[i]

#     (i - 1).downto(0) do |j|
#       debugger
#       if digits[j] < curr
#         swap(digits, i, j)
#         potential = undigitize(digits)
#         if potential > n
#           return potential
#         else
#           swap(digits, i, j)
#         end
#       end
#     end
#   end

#   result = undigitize(digits)
#   puts "result= #{result}"
#   return -1 if result <= n
#   return result
# end

def next_greater_element(n) # n = 1289423 => 1289432, n=21 => -1
  digits = digitize(n)
  length = digits.size

  i = length - 2
  j = length - 1

  i -= 1 while i >= 0 && digits[i] >= digits[i + 1]

  return -1 if i == -1

  j -= 1 while digits[j] <= digits[i]

  digits[i], digits[j] = digits[j], digits[i]

  digits = digits[0..i].concat(digits[i + 1...digits.size].reverse)
  res = undigitize(digits)

  return -1 if res >= 2 ** 31 || res == n

  return res
end

def undigitize(parts)
  parts.reduce(0) { |acc, curr| acc * 10 + curr }
end

def digitize(n)
  result = []
  while n > 9
    remainder = n % 10
    result << remainder
    n /= 10
  end
  result << n
  return result.reverse
end

# Example 1:

# Input:
n = 12
puts next_greater_element(n)
# Output: 21

# Example 2:

# Input:
n = 21
puts next_greater_element(n)
# Output: -1

n = 2352
puts next_greater_element(n)
# Output: 2523

n = 1289423
puts next_greater_element(n)
# Output: 1289432
