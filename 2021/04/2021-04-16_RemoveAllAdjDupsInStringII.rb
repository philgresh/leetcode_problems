# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/595/week-3-april-15th-april-21st/3710/Remove All Adjacent Duplicates in String II
# Given a string S, a K duplicate removal consists of choosing k adjacent and equal letters from s and removing 
# them causing the left and the right side of the deleted substring to concatenate together.

# We repeatedly make k duplicate removals on s until we no longer can.

# Return the final string after all such duplicate removals have been made.

# It is guaranteed that the answer is unique.
require 'byebug'
# @param {String} s
# @param {Integer} k
# @return {String}
def remove_duplicates(s, k)
  return s if s.size == 1
  
  stack = []
  i = 0
  while i <= s.size
    debugger
    if !stack.empty? && stack.last[1] == k
      stack.pop(k)
      break if i == s.size
    else
      char = s[i]
      if !stack.empty? && stack.last[0] == s[i]
        curr_count = stack.last[1]
        stack << [char, curr_count + 1]
      else
        stack << [char, 1]
      end
      i += 1
    end
  end
  return stack.map { |char, count| char }.join('')
end

# Example 1:

# Input: 
s = "abcd"
k = 2
# Output: "abcd"
puts remove_duplicates(s, k)
# Explanation: There's nothing to delete.


# Example 2:
# Input: 
s = "deeedbbcccbdaa"
k = 3
# Output: "aa"
puts remove_duplicates(s, k)
# Explanation: 
# First delete "eee" and "ccc", get "ddbbbdaa"
# Then delete "bbb", get "dddaa"
# Finally delete "ddd", get "aa"

# Example 3:
# Input: 
s = "pbbcggttciiippooaais"
k = 2
# Output: "ps"
puts remove_duplicates(s, k)


# Constraints:

# 1 <= s.length <= 10^5
# 2 <= k <= 10^4
# s only contains lower case English letters.