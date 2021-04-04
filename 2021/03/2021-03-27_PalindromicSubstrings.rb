# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/591/week-4-march-22nd-march-28th/3686/
# Palindromic Substrings
# Given a string, your task is to count how many palindromic substrings in this string.

# The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.

# Strategy:
# Iterate through string by index i
#   At each index, look right to see if those start/end indexes are palindromic
#     Keep a count
# Return the count

# Time complexity: O(s**2)
# Space complexity: O(1)

# @param {String} s
# @return {Integer}
def count_substrings(s)
  count = 0
  s.each_char.with_index do |char, i|
    count += check_at_index(s, i)
  end
  return count
end

def check_at_index(s, i)
  count = 1
  right = i + 1
  while right < s.size
    substr = s[i..right]
    count += 1 if substr == substr.reverse
    right += 1
  end
  return count
end

# Example 1:
# Input: 
s="abc"
# Output: 3
puts count_substrings(s)
# Explanation: Three palindromic strings: "a", "b", "c".
 

# Example 2:
# Input: 
s="aaa"
# Output: 6
puts count_substrings(s)
# Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
 

# Example 3:
# Input: 
s="aba"
# Output: 4
puts count_substrings(s)
 

# Note:

# The input string length won't exceed 1000.