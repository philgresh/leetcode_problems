# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/589/week-2-march-8th-march-14th/3667/
# Integer to Roman
# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000
# For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

# Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

# I can be placed before V (5) and X (10) to make 4 and 9. 
# X can be placed before L (50) and C (100) to make 40 and 90. 
# C can be placed before D (500) and M (1000) to make 400 and 900.
# Given an integer, convert it to a roman numeral.

ROMAN = {
  "I" => 1,
  "V" => 5,
  "X" => 10,
  "L" => 50,
  "C" => 100,
  "D" => 500,
  "M" => 1000,
}

# @param {Integer} num
# @return {String}
def int_to_roman(num)
  thousands = ["", "M", "MM", "MMM"]
  hundreds = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
  tens = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
  ones = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
  return thousands[num / 1000] + hundreds[num % 1000 / 100] + tens[num % 100 / 10] + ones[num % 10]
end

# Example 1:

# Input: 
num = 3
# Output: "III"
puts int_to_roman(num)

# Example 2:

# Input: 
num = 4
# Output: "IV"
puts int_to_roman(num)

# Example 3:

# Input: 
num = 9
# Output: "IX"
puts int_to_roman(num)

# Example 4:

# Input: 
num = 58
# Output: "LVIII"
# Explanation: L = 50, V = 5, III = 3.
puts int_to_roman(num)

# Example 5:

# Input: 
num = 1994
# Output: "MCMXCIV"
puts int_to_roman(num)
# Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
 

# Constraints:

# 1 <= num <= 3999