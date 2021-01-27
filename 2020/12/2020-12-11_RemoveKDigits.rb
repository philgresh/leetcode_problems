# https://leetcode.com/problems/remove-k-digits/
# 402. Remove K Digits
# Medium

# Given a non-negative integer num represented as a string, remove k digits
# from the number so that the new number is the smallest possible.
# Note:

#     The length of num is less than 10002 and will be ≥ k.
#     The given num does not contain any leading zero.

# @param {String} num
# @param {Integer} k
# @return {String}
require "byebug"
require_relative "../../DS/Queue.rb"

def remove_kdigits(input, k)
  return "0" if k == input.size
  return input if k == 0

  # Initialize empty stack and add input vals to queue
  # Pop first val from queue and add to stack
  # While k > 0 and queue.size > 0:
  #   Compare queue.first and stack.last, pop from stack if stack.last is greater
  # Handle leading zeroes
  # Handle remaining k
  # Return

  stack = []
  input.each_char do |char|
    digit = char.to_i
    while k > 0 && stack.size > 0 && stack.last > digit
      stack.pop
      k -= 1
    end
    stack.push(digit)
  end

  stack = stack[0...-k] if k > 0
  i = 0
  i += 1 while i < stack.size - 1 && stack[i] == 0
  return stack[i..-1].join("")
end

# Example 1:

# Input:
num = "1432219"
k = 3
# Output: "1219"
puts remove_kdigits(num, k)
# Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.

# Example 2:

# Input:
num = "10200" # 200
k = 1
# Output: "200"
puts remove_kdigits(num, k)
# Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.

# Example 3:

# Input:
num = "10"
k = 2
# Output: "0"
puts remove_kdigits(num, k)
# Explanation: Remove all the digits from the number and it is left with nothing which is 0.

num = "1234567890"
k = 10
puts remove_kdigits(num, k) # => 0

num = "45319"
k = 2
puts remove_kdigits(num, k) # => 319

num = "112"
k = 1
puts remove_kdigits(num, k) # => 12
