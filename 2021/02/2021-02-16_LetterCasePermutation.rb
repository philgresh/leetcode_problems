# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/586/week-3-february-15th-february-21st/3642/
# Letter Case Permutation

# Given a string S, we can transform every letter individually to be lowercase or uppercase to create another string.

# Return a list of all possible strings we could create. You can return the output in any order.

# Strategy:
# Call helper function where every recursive call flips the case of a letter
# Base case is that this substring length is last
# Push results into an array and return it

# Edge cases:
#   No letters at all: ["0"] => ["0"]

# Data strctures used: array

# Time complexity: O(n) where n is the number of letters
# Space complexity: O(2^n) where n is the number of letters

require "byebug"
# @param {String} s
# @return {String[]}
def letter_case_permutation(s)
  results = []
  helper(s, 0, results)
  return results
end

def helper(s, i, results)
  # debugger
  if i == s.size || !s[i..-1].match(/[a-zA-Z]/)
    results << s[0..-1]
    return
  end

  if s[i].match(/[a-zA-Z]/)
    s[i] = s[i].downcase
    helper(s[0..-1], i + 1, results)
    s[i] = s[i].upcase
  end
  helper(s[0..-1], i + 1, results)
end

# Example 1:

# Input:
s = "a1b2"
# Output: ["a1b2","a1B2","A1b2","A1B2"]
puts letter_case_permutation(s).to_s

# Example 2:

# Input:
s = "3z4"
# Output: ["3z4","3Z4"]
puts letter_case_permutation(s).to_s

# Example 3:

# Input:
s = "12345"
# Output: ["12345"]
puts letter_case_permutation(s).to_s

# Example 4:

# Input:
s = "0"
# Output: ["0"]
puts letter_case_permutation(s).to_s

# Example 5:

# Input:
s = "0a"
# Output: ["0a", "0A"]
puts letter_case_permutation(s).to_s

# Example 6:

# Input:
s = "a1b2c"
# Output: ["a1b2c", "a1b2C", "a1B2c", "a1B2C", "A1b2c", "A1b2C", "A1B2c", "A1B2C"]
puts letter_case_permutation(s).to_s

# Constraints:

#     S will be a string with length between 1 and 12.
#     S will consist only of letters or digits.
