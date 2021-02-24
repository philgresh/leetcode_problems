# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/587/week-4-february-22nd-february-28th/3651/
# Score of Parentheses

# Given a balanced parentheses string S, compute the score of the string based on the following rule:

#     () has score 1
#     AB has score A + B, where A and B are balanced parentheses strings.
#     (A) has score 2 * A, where A is a balanced parentheses string.

# Strategy:

# Edge cases:
#   Empty string => 0
require "byebug"

# @param {String} s
# @return {Integer}
def score_of_parentheses(s)
  stack = [0]

  s.each_char do |char|
    if char == "("
      stack << 0
    else
      v = stack.pop
      stack[-1] += [2 * v, 1].max
    end
  end
  return stack.pop
end

# Example 1:

s = "()"
puts score_of_parentheses(s)
# Output: 1

# Example 2:

s = "(())"
puts score_of_parentheses(s)
# Output: 2

# Example 3:

s = "()()"
puts score_of_parentheses(s)
# Output: 2

# Example 4:

s = "(()(()))"
puts score_of_parentheses(s)
# Output: 6

# Note:

#     S is a balanced parentheses string, containing only ( and ).
#     2 <= S.length <= 50
