# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/589/week-2-march-8th-march-14th/3664/
# Strobogrammatic Number
# Given a string num which represents an integer, return true if num is a strobogrammatic number.

# A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

# Strategy:
# Iterate through string:
  # Working from outside-in, check that each number is its matching (180-degree flip) pair
  # Return false if not
# Return true

# Edge cases:
# String is length 1 => i ==j, while-loop will run once

# Time complexity: O(n)
# Space complexity: O(1)

PAIRS = {
  "0" => "0",
  "1" => "1",
  "6" => "9",
  "8" => "8",
  "9" => "6"
}
# @param {String} num
# @return {Boolean}
def is_strobogrammatic(num)


  i = 0
  j = num.size - 1
  while i <= j
    return false unless PAIRS[num[i]] == num[j]
    i += 1
    j -= 1
  end
  return true
end

# Example 1:

# Input: 
num = "69"
# Output: true
puts is_strobogrammatic(num)

# Example 2:

# Input: 
num = "88"
# Output: true
puts is_strobogrammatic(num)

# Example 3:

# Input: 
num = "962"
# Output: false
puts is_strobogrammatic(num)

# Example 4:

# Input: 
num = "1"
# Output: true
puts is_strobogrammatic(num)

# Example 4:

# Input: 
num = "101"
# Output: true
puts is_strobogrammatic(num)

 

# Constraints:

# 1 <= num.length <= 50
# num consists of only digits.
# num does not contain any leading zeros except for zero itself.