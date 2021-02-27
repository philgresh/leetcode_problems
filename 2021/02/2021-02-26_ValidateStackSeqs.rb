# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/587/week-4-february-22nd-february-28th/3653/
# Validate Stack Sequences

# Given two sequences pushed and popped with distinct values, return true if
# and only if this could have been the result of a sequence of push and pop
# operations on an initially empty stack.

# Strategy:
# Set up two pointers, i & j, pointing to pushed & popped
# Set up empty stack
# Iterate through pushed
#   If pushed[i] == popped[j]
#     Increment j
#   Else
#     push into stack
# Iterate through popped and return false if stack.last != popped[j]
# Return true

# Edge cases:
#   Empty inputs => true
#   Pushed.size != popped.size => false
require "byebug"
# @param {Integer[]} pushed
# @param {Integer[]} popped
# @return {Boolean}
def validate_stack_sequences(pushed, popped)
  j = 0
  stack = []
  pushed.each do |x|
    stack << x
    while stack && j < popped.size && stack.last == popped[j]
      stack.pop
      j += 1
    end
  end
  return j == popped.size
end

# Example 1:

# Input:
pushed = [1, 2, 3, 4, 5]
popped = [4, 5, 3, 2, 1]
# Output: true
puts validate_stack_sequences(pushed, popped)
# Explanation: We might do the following sequence:
# push(1), push(2), push(3), push(4), pop() -> 4,
# push(5), pop() -> 5, pop() -> 3, pop() -> 2, pop() -> 1

# Example 2:

# Input:
pushed = [1, 2, 3, 4, 5]
popped = [4, 3, 5, 1, 2]
# Output: false
puts validate_stack_sequences(pushed, popped)
# Explanation: 1 cannot be popped before 2.

# Example 3:
debugger
# Input:
pushed = [2, 1, 0]
popped = [1, 2, 0]
# Output: true
puts validate_stack_sequences(pushed, popped)

# Constraints:

#     0 <= pushed.length == popped.length <= 1000
#     0 <= pushed[i], popped[i] < 1000
#     pushed is a permutation of popped.
#     pushed and popped have distinct values.
