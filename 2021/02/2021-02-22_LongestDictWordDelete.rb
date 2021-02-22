# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/587/week-4-february-22nd-february-28th/3649/
# Longest Word in Dictionary through Deleting

# Given a string and a string dictionary, find the longest string in the
# dictionary that can be formed by deleting some characters of the given string.
# If there are more than one possible results, return the longest word with the
#  smallest lexicographical order. If there is no possible result, return the
# empty string.

require "test/unit"
extend Test::Unit::Assertions

# Sort the words in the dictionary in reverse order ( O(d log d) )
# Iterate through words in dictionary
#   Using pointers i (for s) and j (for word), iterate through word/s,
#     keeping track of deletions
#   Keep track of longest matching so far, replace if it's lexigraphically earlier
#   Skip over words if diff between word.size - s.size > longest_so_far.size
# Return longest_so_far

# Edge cases:
#   Empty dictionary => ''
#

# Time complexity: O(s*d*|max d.size|) ?
# Space complexity: O(1) -> can sort in-place, storing longest_so_far only

# @param {String} s
# @param {String[]} d
# @return {String}
def find_longest_word(s, d)
  return "" if d.empty?
  # d.sort! { |a,b| b.size <=> a.size }
  longest_so_far = [""]
  d.each do |word|
    return s if s == word
    find_longest_word_helper(s, word, longest_so_far)
  end
  return longest_so_far[0]
end

def find_longest_word_helper(s, word, longest_so_far)
  i = 0
  j = 0
  longest = longest_so_far[0]

  return if word.size < longest.size

  while i < s.size && j < word.size
    if s[i] == word[j]
      j += 1
    end
    i += 1
  end
  if j == word.size
    case word.size <=> longest.size
    when 0
      longest_so_far[0] = [longest, word].min
    when 1
      longest_so_far[0] = word
    end
  end
end

# Example 1:

# Input:
#
s = "abpcplea"
d = ["ale", "apple", "monkey", "plea"]
expected = "apple"
result = find_longest_word(s, d)
assert(result == expected, "Expected: [#{expected}], got: [#{result}]")

# Example 2:

# Input:
#
s = "abpcplea"
d = ["a", "b", "c"]
expected = "a"
result = find_longest_word(s, d)
assert(result == expected, "Expected: [#{expected}], got: [#{result}]")

# Example 3:

# Input:
#
s = "abpcpleaabpcpleaabpcpleaabpcpleaabpcpleaabpcpleaabpcpleaabpcpleaabpcpleaabpcpleamonkey"
d = ["ale", "apple", "monkey", "plea"]
expected = "monkey"
result = find_longest_word(s, d)
assert(result == expected, "Expected: [#{expected}], got: [#{result}]")

# Example 4:

# Input:
#
s = "abpcplea"
d = ["a", "abpcplea", "c"]
expected = "abpcplea"
result = find_longest_word(s, d)
assert(result == expected, "Expected: [#{expected}], got: [#{result}]")

# Note:

#     All the strings in the input will only contain lower-case letters.
#     The size of the dictionary won't exceed 1,000.
#     The length of all the strings in the input won't exceed 1,000.
