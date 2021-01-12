# https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/570/week-2-december-8th-december-14th/3565/

# Palindrome Partitioning

# Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.

# A palindrome string is a string that reads the same backward as forward.

# Set up i pointer = 0
# Set up array to store results
# Iterate through s, taking a substring by incrementing j
#   Check if substring is a palindrome
#   Add to results if not already
# Return results

require "byebug"
# @param {String} s
# @return {String[][]}
def partition(s)
  results = Array.new
  backtrack(results, [], s, 0)
  debugger
  return results
end

def backtrack(results, tmp, s, start)
  if s.size == start
    results << tmp
    return
  end

  (start...s.size).each do |i|
    if is_palindrome(s, start, i)
      debugger
      tmp << s[start..i]
      backtrack(results, tmp, s, i + 1)
      tmp.pop
    end
  end
end

def is_palindrome(s, start, ending)
  i = start
  j = ending
  while (i <= j)
    return false if s[i] != s[j]
    i += 1
    j -= 1
  end
  return true
end

# Example 1:

# Input:
s = "aab"
puts partition(s)
# Output: [["a","a","b"],["aa","b"]]

# Example 2:

# Input:
s = "a"
puts partition(s)
# Output: [["a"]]

# Constraints:

#     1 <= s.length <= 16
#     s contains only lowercase English letters.
