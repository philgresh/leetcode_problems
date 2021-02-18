# https://leetcode.com/explore/featured/card/february-leetcoding-challenge-2021/586/week-3-february-15th-february-21st/3644/
# Arithmetic Slices

# A sequence of numbers is called arithmetic if it consists of at least three
# elements and if the difference between any two consecutive elements is the same.

# For example, these are arithmetic sequences:

# 1, 3, 5, 7, 9
# 7, 7, 7, 7
# 3, -1, -5, -9

# The following sequence is not arithmetic.

# 1, 1, 2, 5, 7

# A zero-indexed array A consisting of N numbers is given. A slice of that
# array is any pair of integers (P, Q) such that 0 <= P < Q < N.

# A slice (P, Q) of the array A is called arithmetic if the sequence:
# A[P], A[P + 1], ..., A[Q - 1], A[Q] is arithmetic. In particular, this means
# that P + 1 < Q.

# The function should return the number of arithmetic slices in the array A.

# Strategy:
# Iterate through array starting at index 2
# Looking back, check if we're in a sequence
#   If so, we also might be continuing a sequence
#     Increment dp[i] based on previous dp[i-1]
# Return the sum of dp (or keep track along the way)

# Edge cases:
#   array length < 3 => 0 (will be handled by starting at index 2)
#   All same values => should still work (diff == 0)

# Data structures:
#   dp array (same size)

# Time complexity: O(n) where n is the length of a
# Space complexity: O(n) for dp

require "byebug"
# @param {Integer[]} a
# @return {Integer}
def number_of_arithmetic_slices(a)
  sum = 0
  dp = Array.new(a.size).fill(0)
  (2...a.size).each do |i|
    if a[i] - a[i - 1] == a[i - 1] - a[i - 2]
      dp[i] = 1 + dp[i - 1]
      sum += dp[i]
    end
  end
  return sum
end

# Example 1:
a = [1, 2, 3, 4]
puts number_of_arithmetic_slices(a)
# return: 3, for 3 arithmetic slices in A:
#   [1, 2, 3],
#   [2, 3, 4] and
#   [1, 2, 3, 4] itself.

# Example 2:
a = [1, 3, 5, 7, 9]
puts number_of_arithmetic_slices(a)
# Expect 6

# Example 3:
a = [7, 7, 7, 7]
puts number_of_arithmetic_slices(a)
# Expect 3

# Example 4:
a = [3, -1, -5, -9]
puts number_of_arithmetic_slices(a)
# Expect 3

# Example 5:
a = [1, 1, 2, 5, 7]
puts number_of_arithmetic_slices(a)
# Expect 0

# Example 6:
a = [1, 1]
puts number_of_arithmetic_slices(a)
# Expect 0

# Example 7:
a = [1, 1, 2, 5, 7, 3, -1, -5, -9, 7, 7, 7, 7]
puts number_of_arithmetic_slices(a)
# Expect 9

# Example 8:
# debugger
a = [1, 2, 3]
puts number_of_arithmetic_slices(a)
# return: 1
