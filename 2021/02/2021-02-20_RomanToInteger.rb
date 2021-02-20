# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/586/week-3-february-15th-february-21st/3646/
# Roman to Integer

# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

# Symbol       Value
VALUES = {
  "I" => 1,
  "V" => 5,
  "X" => 10,
  "L" => 50,
  "C" => 100,
  "D" => 500,
  "M" => 1000,
}
# For example, 2 is written as II in Roman numeral, just two one's added
# together. 12 is written as XII, which is simply X + II. The number 27 is
# written as XXVII, which is XX + V + II.

# Roman numerals are usually written largest to smallest from left to right.
# However, the numeral for four is not IIII. Instead, the number four is
# written as IV. Because the one is before the five we subtract it making four.
# The same principle applies to the number nine, which is written as IX.
# There are six instances where subtraction is used:

#     I can be placed before V (5) and X (10) to make 4 and 9.
#     X can be placed before L (50) and C (100) to make 40 and 90.
#     C can be placed before D (500) and M (1000) to make 400 and 900.

# Given a roman numeral, convert it to an integer.

# Strategy:
# Starting at index 1, iterate through s
# If the value of s[i] > value of s[i-1], subtract s[i-1] from s[i] and add to sum.
# Else, add both to sum and add 2 to idx

# Edge cases:
#   Empty string => 0

# Time complexity: O(s)
# Space complexity: O(1)

require "byebug"
require "test/unit"
extend Test::Unit::Assertions

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  return 0 if s.empty?

  sum = 0
  i = 0
  while i < s.size
    if i > 0 && VALUES[s[i - 1]] < VALUES[s[i]]
      sum -= VALUES[s[i - 1]] * 2
    end
    sum += VALUES[s[i]]
    i += 1
  end

  return sum
end

# Example 1:

# Input:
s = "III"
expected = 3

result = roman_to_int(s)
assert(result == expected)

# Example 2:

# Input:
s = "IV"
expected = 4
result = roman_to_int(s)
assert(result == expected)

# Example 3:

# Input:
s = "IX"
expected = 9
result = roman_to_int(s)
assert(result == expected)

# Example 4:

# Input:
s = "LVIII"
expected = 58
result = roman_to_int(s)
assert(result == expected)
# Explanation: L = 50, V= 5, III = 3.

# Example 5:

# Input:
s = "MCMXCIV"
expected = 1994
result = roman_to_int(s)
assert(result == expected)
# Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

# Example 6:

# Input:
s = "V"
expected = 5
result = roman_to_int(s)
assert(result == expected)

# Example 7:

# Input:
s = ""
expected = 0
result = roman_to_int(s)
assert(result == expected)

# Constraints:

#     1 <= s.length <= 15
#     s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
#     It is guaranteed that s is a valid roman numeral in the range [1, 3999].
