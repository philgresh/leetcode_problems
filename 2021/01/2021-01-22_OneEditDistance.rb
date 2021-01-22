# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/582/week-4-january-22nd-january-28th/3612/
# One Edit Distance

# Given two strings s and t, return true if they are both one edit distance apart, otherwise return false.

# A string s is said to be one distance apart from a string t if you can:

#     Insert exactly one character into s to get t.
#     Delete exactly one character from s to get t.
#     Replace exactly one character of s with a different character to get t.
require "byebug"
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_one_edit_distance(s, t)
  size_diff = t.size - s.size
  return false if (size_diff).abs > 1

  i = find_first_nonmatching_idx(s, t)
  return false if i == s.size && i == t.size && s == t

  j = i
  if size_diff == 0
    # replacement of char at s[i]
    return s[i + 1..-1] == t[i + 1..-1]
  elsif s[i] == t[j + 1]
    j += 1 # deletion
  elsif s[i + 1] == t[j]
    i += 1 # insertion
  end
  return s[i..-1] == t[j..-1]
end

def find_first_nonmatching_idx(s, t)
  i = 0
  while i < s.size && i < t.size
    break if s[i] != t[i]
    i += 1
  end
  return i
end

# Example 1:

# Input:
s = "ab"
t = "acb"
# Output: true
puts is_one_edit_distance(s, t)
# Explanation: We can insert 'c' into s to get t.

# Example 2:

# Input:
s = ""
t = ""
# Output: false
puts is_one_edit_distance(s, t)
# Explanation: We cannot get t from s by only one step.

# Example 3:

# Input:
s = "a"
t = ""
# Output: true
puts is_one_edit_distance(s, t)

# Example 4:

# Input:
s = ""
t = "A"
# Output: true
puts is_one_edit_distance(s, t)

# Example 5:

# Input:
s = "abcdefghijklmnopqrstuvwxyz" * 190
t = "abcdefghijklmnopqrstuvwxyz" * 190
# Output: false (identical inputs)
puts is_one_edit_distance(s, t)

# Example 6:

# Input:
s = "abcdefghijklmnopqrstuvwxyz" * 190
t = "z" + "abcdefghijklmnopqrstuvwxyz" * 190
# Output: true
puts is_one_edit_distance(s, t)

# Example 7:

# Input:
s = "a"
t = "A"
# Output: true
puts is_one_edit_distance(s, t)

# Constraints:

#     0 <= s.length <= 104
#     0 <= t.length <= 104
#     s and t consist of lower-case letters, upper-case letters and/or digits.
