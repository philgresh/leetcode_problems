# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/581/week-3-january-15th-january-21st/3609/
# Longest Palindromic Substring

# O(n^2) time | O(n) space (due to  slicing str at the return statement)

# Given a string s, return the longest palindromic substring in s.
# @param {String} s
# @return {String}
def longest_palindrome(str)
  longest = [0, 1, 1]
  (1...str.size).each do |i|
    odd = longest_from(str, i - 1, i + 1)
    even = longest_from(str, i - 1, i)
    longest_here = odd[2] > even[2] ? odd : even
    longest = longest_here if longest[2] < longest_here[2]
  end
  return str[longest[0]...longest[1]]
end

def longest_from(string, i, j)
  while i >= 0 && j < string.length
    break if string[i] != string[j]
    i -= 1
    j += 1
  end
  i += 1
  return [i, j, j - i]
end

# O(n^3) time | O(n) space

# @param {String} s
# @return {String}
# def longest_palindrome(s)
#   longest = ''
#   longest_len = 0
#   s.each_char.with_index do |char, i|
#     (i...s.size).each do |j|
#       substring = s[i..j]
#       if is_palindromic?(substring) && substring.size > longest_len
#         longest_len = substring.size
#         longest = substring
#       end
#     end
#   end
#   return longest
# end

# def is_palindromic?(str)
#   i = 0
#   j = str.size - 1
#   while i <= j
#     return false if str[i] != str[j]
#     i += 1
#     j -= 1
#   end
#   return true
# end

# Example 1:

# Input:
s = "babad"
# Output: "bab"
puts longest_palindrome(s)
# Note: "aba" is also a valid answer.

# Example 2:

# Input:
s = "cbbd"
# Output: "bb"
puts longest_palindrome(s)

# Example 3:

# Input:
s = "a"
# Output: "a"
puts longest_palindrome(s)

# Example 4:

# Input:
s = "ac"
# Output: "a"
puts longest_palindrome(s)

# Constraints:

#     1 <= s.length <= 1000
#     s consist of only digits and English letters (lower-case and/or upper-case),
