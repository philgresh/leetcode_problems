# https://leetcode.com/problems/add-strings/
# 415. Add Strings
# Easy

# Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.

# Note:

#     The length of both num1 and num2 is < 5100.
#     Both num1 and num2 contains only digits 0-9.
#     Both num1 and num2 does not contain any leading zero.
#     You must not use any built-in BigInteger library or convert the inputs to integer directly.
require "test/unit"
extend Test::Unit::Assertions

# @param {String} num1
# @param {String} num2
# @return {String}
def add_strings(num1, num2)
  res = ""
  carry = 0
  p1 = num1.size - 1
  p2 = num2.size - 1
  while p1 >= 0 || p2 >= 0
    x1 = p1 >= 0 ? num1[p1].to_i : 0
    x2 = p2 >= 0 ? num2[p2].to_i : 0
    sum = x1 + x2 + carry
    val = sum % 10
    carry = (sum / 10).floor
    res += val.to_s
    p1 -= 1
    p2 -= 1
  end

  res += carry.to_s if carry != 0

  return res.reverse
end

def build_int
  num = ""
  count = rand(1...5100)
  while count > 0
    num = "#{num}#{rand(0..9)}"
    count -= 1
  end
  num
end

# Example 1
# num1 = build_int
# num2 = build_int
# result = add_strings(num1.to_s, num2.to_s)
# expected = (num1 + num2).to_s
# assert(result == expected, "Failed example 1: Expected: #{expected}, got: #{result}")

# # Example 2
num1 = "19999999"
num2 = "1"
result = add_strings(num1, num2)
expected = "20000000"
assert(result == expected, "Failed example 2: Expected: #{expected}, got: #{result}")
