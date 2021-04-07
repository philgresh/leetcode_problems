# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/593/week-1-april-1st-april-7th/3699/
# Determine if String Halves Are Alike
# You are given a string s of even length. Split this string into two halves of equal lengths, and let a be the first half and b be the second half.

# Two strings are alike if they have the same number of vowels ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'). Notice that s contains uppercase and lowercase letters.

# Return true if a and b are alike. Otherwise, return false.
require 'set'
VOWELS = Set.new(%w(a e i o u A E I O U))
# @param {String} s
# @return {Boolean}
def halves_are_alike(s)
  mid = s.size / 2
  a, b = s[0...mid], s[mid..-1]
  get_vowels(a) == get_vowels(b)
end

def get_vowels(str)
  count = 0 
  str.each_char { |char| count += 1 if VOWELS.include?(char) }
  return count
end

# Example 1:

# Input: 
s = "book"
# Output: true
puts halves_are_alike(s)
# Explanation: a = "bo" and b = "ok". a has 1 vowel and b has 1 vowel. Therefore, they are alike.

# Example 2:

# Input: 
s = "textbook"
# Output: false
puts halves_are_alike(s)
# Explanation: a = "text" and b = "book". a has 1 vowel whereas b has 2. Therefore, they are not alike.
# Notice that the vowel o is counted twice.

# Example 3:

# Input: 
s = "MerryChristmas"
# Output: false
puts halves_are_alike(s)

# Example 4:

# Input: 
s = "AbCdEfGh"
# Output: true
puts halves_are_alike(s)


# Constraints:

# 2 <= s.length <= 1000
# s.length is even.
# s consists of uppercase and lowercase letters.