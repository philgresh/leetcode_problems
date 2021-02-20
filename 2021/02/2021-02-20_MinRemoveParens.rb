# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/586/week-3-february-15th-february-21st/3645/
# Minimum Remove to Make Valid Parentheses

# Given a string s of '(' , ')' and lowercase English characters.

# Your task is to remove the minimum number of parentheses ( '(' or ')',
# in any positions ) so that the resulting parentheses string is valid and
# return any valid string.

# Formally, a parentheses string is valid if and only if:

#     It is the empty string, contains only lowercase characters, or
#     It can be written as AB (A concatenated with B), where A and B are
#       valid strings, or
#     It can be written as (A), where A is a valid string.

# Strategy:
# Iterate through string
#   Keep track of parens & index with stack
#   If we come across an opening paren, push to stack with index
#   If we come across a closing paren, pop the top of the stack
#     If they match, continue
#     Else, mark closing paren to be removed later
# Mark all remaining parens in the stack to be removed
# Return string without parens that are marked

# Edge cases:
# s == '' => return ''

# Data structures:
#   Stack (native array with push/pop/size)

# Time complexity: O(s)
# Space complexity: O(s) because stack could potentially be length of s
require "byebug"
require "test/unit"
extend Test::Unit::Assertions

# @param {String} s
# @return {String}
def min_remove_to_make_valid(s)
  return "" if s == ""

  stack = []
  to_be_removed = {}

  s.each_char.with_index do |char, i|
    if char == "("
      stack.push([char, i])
    elsif char == ")"
      if stack.empty?
        stack.push([char, i])
      else
        last = stack.last
        if last[0] == "("
          stack.pop
        else
          stack.push([char, i])
        end
      end
    end
  end

  stack.each do |ele|
    char, idx = ele
    to_be_removed[idx] = true
  end

  remove_from_s(s, to_be_removed)
end

def remove_from_s(s, to_be_removed)
  new_s = ""
  s.each_char.with_index do |char, i|
    new_s += char unless to_be_removed.include?(i)
  end

  new_s
end

# Example 1:

# Input:
s = "lee(t(c)o)de)"
expected = "lee(t(c)o)de"
result = min_remove_to_make_valid(s)
assert(result == expected)
# Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.

# Example 2:

# Input:
s = "a)b(c)d"
expected = "ab(c)d"
result = min_remove_to_make_valid(s)
assert(result == expected)

# Example 3:

# Input:
s = "))(("
expected = ""
result = min_remove_to_make_valid(s)
assert(result == expected)
# Explanation: An empty string is also valid.

# Example 4:

# Input:
s = "(a(b(c)d)"
expected = "a(b(c)d)"
result = min_remove_to_make_valid(s)
assert(result == expected)

# Constraints:

#     1 <= s.length <= 10^5
#     s[i] is one of  '(' , ')' and lowercase English letters.
