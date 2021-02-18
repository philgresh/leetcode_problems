# https://leetcode.com/problems/minimum-window-substring/description/
# 76. Minimum Window Substring
# Hard

# Given two strings s and t, return the minimum window in s which will
# contain all the characters in t. If there is no such window in s that
# covers all characters in t, return the empty string "".

# Note that If there is such a window, it is guaranteed that there will
# always be only one unique minimum window in s.

# Strategy:
# Set pointers at i = 0, j = t.size-1
# Set min_so_far as length of string
# Calculate frequencies of each letter in t for substring
# While j < end
# Move pointer j forward until end or we have a substring that contains at least 1 of
#   each letter in t
# Move i forward while keeping our required letter frequencies

# Edge cases:
#   Min string is whole string, we should see frequency of at least 2 letters be 1 => return whole string
#   s-length or t-length == 1 => return 1 since we're guaranteed a unique min window

# Time complexity: O(|s|+|t|) if we used Sets and Hashes
# Space complexity: O(|s|)
require "byebug"
require "set"
# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  return "" if s.size < t.size
  dict_t = Hash.new(0)
  t.each_char do |char|
    dict_t[char] += 1
  end
  required = dict_t.keys.size

  l = 0
  r = 0
  formed = 0
  window_counts = Hash.new(0)
  ans = [Float::INFINITY, nil, nil]

  while r < s.size
    char = s[r]
    window_counts[char] += 1

    if dict_t.include?(char) && window_counts[char] == dict_t[char]
      formed += 1
    end

    while l <= r && formed == required
      char = s[l]

      if r - l + 1 < ans[0]
        ans = [r - l + 1, l, r]
      end

      window_counts[char] -= 1
      if dict_t.include?(char) && window_counts[char] < dict_t[char]
        formed -= 1
      end

      l += 1
    end
    r += 1
  end
  if ans[0] == Float::INFINITY
    return ""
  else
    return s[ans[1]..ans[2]]
  end
end

# Example 1:

# Input:
s = "ADOBECODEBANC"
t = "ABC"
# Output: "BANC"
puts min_window(s, t)

# Example 2:

# Input:
s = "a"
t = "a"
# Output: "a"
puts min_window(s, t)

# Example 3:

# Input:
s = "CNABEDOCEBODA"
t = "BAC"
# Output: "CNAB"
puts min_window(s, t)

# Example 4:

# Input:
s = "aa"
t = "aa"
# Output: "aa"
puts min_window(s, t)

# Constraints:

#     1 <= s.length, t.length <= 105
#     s and t consist of English letters.

# Follow up: Could you find an algorithm that runs in O(n) time?
