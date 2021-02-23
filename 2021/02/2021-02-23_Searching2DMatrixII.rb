# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/587/week-4-february-22nd-february-28th/3650/
# Search a 2D Matrix II

# Write an efficient algorithm that searches for a target value in an m x n integer matrix. The matrix has the following properties:

#     Integers in each row are sorted in ascending from left to right.
#     Integers in each column are sorted in ascending from top to bottom.

# Strategy:
# BST top row and first column to find best matching (last number lte target)
#   Return if target
# From [row, col], check current cell for target
#   If no match, move to [left, top].min

# Edge cases:
#   Matrix is one-by-x: Should work like normal, just check for out-of-bounds

require "test/unit"
extend Test::Unit::Assertions

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  row = matrix.size - 1
  col = 0
  while row >= 0 && col < matrix[0].size
    puts matrix[row][col]
    if matrix[row][col] > target
      row -= 1
    elsif matrix[row][col] < target
      col += 1
    else
      return true
    end
  end
  return false
end

# Example 1:

# Input:
matrix = [
  [1, 4, 7, 11, 15],
  [2, 5, 8, 12, 19],
  [3, 6, 9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30],
]
target = 5
expected = true
result = search_matrix(matrix, target)
assert(result == expected, "Expected: [#{expected}], got: [#{result}]")

# Example 2:

# Input:
matrix = [[1, 4, 7, 11, 15], [2, 5, 8, 12, 19], [3, 6, 9, 16, 22], [10, 13, 14, 17, 24], [18, 21, 23, 26, 30]]
target = 20
expected = false
result = search_matrix(matrix, target)
assert(result == expected, "Expected: [#{expected}], got: [#{result}]")

# Constraints:

#     m == matrix.length
#     n == matrix[i].length
#     1 <= n, m <= 300
#     -109 <= matix[i][j] <= 109
#     All the integers in each row are sorted in ascending order.
#     All the integers in each column are sorted in ascending order.
#     -109 <= target <= 109
