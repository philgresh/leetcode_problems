# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/581/week-3-january-15th-january-21st/3610/
# Valid Parentheses

# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# An input string is valid if:

#     Open brackets must be closed by the same type of brackets.
#     Open brackets must be closed in the correct order.

# O(s) time | O(s) space

CLOSING = {
  "}" => "{",
  ")" => "(",
  "]" => "[",
}
# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []
  s.each_char do |char|
    opening = CLOSING[char]
    if opening.nil?
      stack.push(char)
    else
      last = stack.pop
      return false if opening != last
    end
  end
  return false unless stack.empty?
  return true
end

# Example 1:

# Input:
s = "()"
# Output: true
puts is_valid(s)

# Example 2:

# Input:
s = "()[]{}"
# Output: true
puts is_valid(s)

# Example 3:

# Input:
s = "(]"
# Output: false
puts is_valid(s)

# Example 4:

# Input:
s = "([)]"
# Output: false
puts is_valid(s)

# Example 5:

# Input:
s = "{[]}"
# Output: true

puts is_valid(s)

# Constraints:

#     1 <= s.length <= 104
#     s consists of parentheses only '()[]{}'.
