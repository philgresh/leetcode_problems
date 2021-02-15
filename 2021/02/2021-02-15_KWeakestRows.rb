# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/586/week-3-february-15th-february-21st/3641/
# The K Weakest Rows in a Matrix

# Given a m * n matrix mat of ones (representing soldiers) and zeros
# (representing civilians), return the indexes of the k weakest rows in
# the matrix ordered from the weakest to the strongest.

# A row i is weaker than row j, if the number of soldiers in row i is less
# than the number of soldiers in row j, or they have the same number of
# soldiers but i is less than j. Soldiers are always stand in the frontier
# of a row, that is, always ones may appear first and then zeros.

# Strategy:
# [4,2,3,1] k = 2 => [3, 1]
# Iterate through rows, determine number of soldiers, add to PriorityQueue
# Set up while-loop to pop row indexes from PQ into results array
# Return results array

# Edge cases:
#   All are equal vals => return indexes in order?
#   k = 0 => return empty array

# Data structures:
#   Priority queue/heap (insert = O(log n) each, retrieveMin = O(log n) )

# Time complexity: O(n * log n)
# Space complexity: O(n) ?
require "byebug"
require_relative "../../DS/PriorityQueue.rb"
# @param {Integer[][]} mat
# @param {Integer} k
# @return {Integer[]}
def k_weakest_rows(mat, k)
  pq = setup_pq(mat)

  results = []
  debugger
  while k > 0
    soldier_count, index = pq.pop
    results << index
    k -= 1
  end
  return results
end

def setup_pq(mat)
  pq = PriorityQueue.new do |a, b|
    # Store vals as [soldiers, index]
    # Sort by index if soldier count is the same
    if a[0] == b[0]
      b[1] <=> a[1]
    else
      b[0] <=> a[0]
    end
  end
  mat.each_with_index do |row, i|
    soldier_count = row.count(1)
    pq.push([soldier_count, i])
  end
  return pq
end

# Example 1:

# Input:
mat =
  [[1, 1, 0, 0, 0],
   [1, 1, 1, 1, 0],
   [1, 0, 0, 0, 0],
   [1, 1, 0, 0, 0],
   [1, 1, 1, 1, 1]]
k = 3
# Output: [2,0,3]
# puts k_weakest_rows(mat, k).to_s
# Explanation:
# The number of soldiers for each row is:
# row 0 -> 2
# row 1 -> 4
# row 2 -> 1
# row 3 -> 2
# row 4 -> 5
# Rows ordered from the weakest to the strongest are [2,0,3,1,4]

# Example 2:

# Input:
mat =
  [[1, 0, 0, 0],
   [1, 1, 1, 1],
   [1, 0, 0, 0],
   [1, 0, 0, 0]]
k = 2
# Output: [0,2]
# puts k_weakest_rows(mat, k).to_s

# Explanation:
# The number of soldiers for each row is:
# row 0 -> 1
# row 1 -> 4
# row 2 -> 1
# row 3 -> 1
# Rows ordered from the weakest to the strongest are [0,2,3,1]

# Example 3:

# Input:
mat = [
  [1, 0, 0], #0
  [1, 0, 0], #1
  [0, 0, 0], #2
  [1, 0, 0], #3
  [1, 0, 0], #4
  [1, 1, 1], #5
  [1, 1, 0],  #6
]

k = 7
# Output: [2,0,1,3,4,6,5]
puts k_weakest_rows(mat, k).to_s

# Explanation:
# The number of soldiers for each row is:
# row 0 -> 1
# row 1 -> 4
# row 2 -> 1
# row 3 -> 1
# Rows ordered from the weakest to the strongest are [0,2,3,1]

# Constraints:

#     m == mat.length
#     n == mat[i].length
#     2 <= n, m <= 100
#     1 <= k <= m
#     matrix[i][j] is either 0 or 1.
