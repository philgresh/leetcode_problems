# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/593/week-1-april-1st-april-7th/3695/
# Longest Valid Parentheses

# Given a string containing just the characters '(' and ')', find the length of the 
# longest valid (well-formed) parentheses substring.


# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  longest_so_far = 0
  stack = [-1]

  s.each_char.with_index do |char, i|
    if char == '('
      stack << i
    else
      stack.pop
      if stack.empty?
        stack << i
      else
        longest_so_far = [longest_so_far, i - stack.last].max
      end
    end
  end 

  return longest_so_far
end

# Example 1:

# Input: 
s = "(()"
# Output: 2
puts longest_valid_parentheses(s)
# Explanation: The longest valid parentheses substring is "()".

# Example 2:

# Input: 
s = ")()())"
# Output: 4
puts longest_valid_parentheses(s)
# Explanation: The longest valid parentheses substring is "()()".

# Example 3:
# Input: 
s = ""
# Output: 0
puts longest_valid_parentheses(s)
 

# Constraints:

#     0 <= s.length <= 3 * 104
#     s[i] is '(', or ')'.

