# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/594/week-2-april-8th-april-14th/3701/
# Letter Combinations of a Phone Number
# Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

# A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

# Strategy:
# Recursively call our helper function and add results to an array ref that's passed down
#   Pop off the first number
#   Iterate through the letters of each and add the result of the recursive function for that letter plus the remainder
# Return results

# Edge cases:
# digits.length == 0 => return []

# Time complexity: O(n**2)
# Space complexity: O(n)
require 'byebug'

ABC = {
  "2" => "abc",
  "3" => "def",
  "4" => "ghi",
  "5" => "jkl",
  "6" => "mno",
  "7" => "pqrs",
  "8" => "tuv",
  "9" => "wxyz"
}

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits.size == 0
  results = []
  helper(digits, results)
  return results
end

def helper(digits, results, element="")
  if digits.size == 0
    results << element
    return
  end
  this_num = digits[0]
  ABC[this_num].each_char do |letter|
    new_element = element+letter
    helper(digits[1..-1], results, new_element)
  end
end
 

# Example 1:

# Input: 
digits = "23"
# Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
puts letter_combinations(digits).to_s

# Example 2:

# Input: 
digits = ""
# Output: []
puts letter_combinations(digits).to_s

# Example 3:

# Input: 
digits = "2"
# Output: ["a","b","c"]
puts letter_combinations(digits).to_s

 

# Constraints:

# 0 <= digits.length <= 4
# digits[i] is a digit in the range ['2', '9'].