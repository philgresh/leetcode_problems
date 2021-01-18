# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/581/week-3-january-15th-january-21st/3607/
# Count Sorted Vowel Strings

# Given an integer n, return the number of strings of length n that consist only of vowels (a, e, i, o, u) and are lexicographically sorted.

# A string s is lexicographically sorted if for all valid i, s[i] is the same as or comes before s[i+1] in the alphabet.
require "byebug"
# @param {Integer} n
# @return {Integer}
def count_vowel_strings(n)
  a = [1] * 5
  (1...n).each do
    (1...5).each do |i|
      a[i] += a[i - 1]
    end
  end

  return a.sum
end

# Example 1:

# Input:
n = 1
# Output: 5
puts count_vowel_strings(n)
# Explanation: The 5 sorted strings that consist of vowels only are ["a","e","i","o","u"].

# Example 2:

# Input:
n = 2
# Output: 15
puts count_vowel_strings(n)
# Explanation: The 15 sorted strings that consist of vowels only are
# ["aa","ae","ai","ao","au","ee","ei","eo","eu","ii","io","iu","oo","ou","uu"].
# Note that "ea" is not a valid string since 'e' comes after 'a' in the alphabet.

# Example 3:

# Input:
n = 33
# Output: 66045
puts count_vowel_strings(n)

# Constraints:

#     1 <= n <= 50
