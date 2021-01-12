# https://leetcode.com/problems/remove-k-digits/
# 402. Remove K Digits
# Medium

# Given a non-negative integer num represented as a string, remove k digits from the number so that the new number is the smallest possible.
# Note:

#     The length of num is less than 10002 and will be ≥ k.
#     The given num does not contain any leading zero.

# Iterate through num with index i = 0 while i < num.size - 1
#   If num[i+1] < num[i] then we'll remove i (If all the same, remove the last)
#   Recursively call the function with the shortened number and decremented k
# Return

# @param {String} num
# @param {Integer} k
# @return {String}
require "byebug"

def remove_kdigits(num, k)
  return num.to_i if k == 0

  i = 0
  new_num = num
  while i < num.size - 1
    if num[i].to_i > num[i + 1].to_i
      new_num = num[0...i].concat(num[i + 1..-1])
      break
    end
    i += 1
  end
  if i == num.size - 1
    new_num = num[0...-1]
  end

  min_num = remove_kdigits(new_num, k - 1)
  return min_num.to_i.to_s
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
