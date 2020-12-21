# https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/571/week-3-december-15th-december-21st/3573/
# Given an array A of integers, for each integer A[i] we need to choose either x = -K or x = K, and add x to A[i] (only once).

# After this process, we have some array B.

# Return the smallest possible difference between the maximum value of B and the minimum value of B.
require "byebug"
# [1,6] k = 5
# [6,1] vs [6,11]

# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def smallest_range_ii(arr, k)
  arr.sort!
  min = arr[0]
  max = arr[-1]
  answer = max - min
  (0...arr.length - 1).each do |i|
    a = arr[i]
    b = arr[i + 1]
    answer = [
      answer, 
      [max - k, a + k].max - [min + k, b - k].min
    ].min
  end
  answer
end

# Example 1:

# Input:
a = [1]
k = 0
# Output: 0
# puts smallest_range_ii(a, k)

# Explanation: B = [1]

# Example 2:

# Input:
a = [0, 10]
k = 2
# Output: 6
puts smallest_range_ii(a, k)
# Explanation: B = [2,8]

# Example 3:

# Input:
a = [1, 3, 6]
k = 3
# Output: 3
puts smallest_range_ii(a, k)
# Explanation: B = [4,6,3]

# Note:

#     1 <= A.length <= 10000
#     0 <= A[i] <= 10000
#     0 <= K <= 10000
