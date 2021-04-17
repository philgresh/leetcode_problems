# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/595/week-3-april-15th-april-21st/3711/
# Number of Submatrices That Sum to Target
# Given a matrix and a target, return the number of non-empty submatrices that sum to target.

# A submatrix x1, y1, x2, y2 is the set of all cells matrix[x][y] with x1 <= x <= x2 and y1 <= y <= y2.

# Two submatrices (x1, y1, x2, y2) and (x1', y1', x2', y2') are different if they have some coordinate that is different: for example, if x1 != x1'.

# Strategy:
# Iterate through matrix starting from top-left
#   On each iteration, check to see if the whole matrix given would sum to the target (count += 1 if so)
#   Then, recurvsively call with a smaller matrix starting at that cell:
#     One row less
#     One column less
# Return count

# Base case:
#   One cell

require 'byebug'
# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Integer}
def num_submatrix_sum_target(matrix, target)
  n = matrix.size
  m = matrix[0].size

  matrix.each.with_index do |row, i|
    row.each.with_index do |col, j|
      start_pos = [i, j]
      end_pos = [n-1, m-1]
      count += helper(matrix, start_pos, end_pos, target)
    end
  end
  return count
end

def helper(matrix, start_pos, end_pos, target)
  debugger
  if start_pos == end_pos
    return matrix[start_pos[0]][start_pos[1]] == target ? 1 : 0
  end
  count = 0
  count += 1 if sum_all(matrix) == target
  less_one_row = [end_pos[0]-1, end_pos[1]]
  less_one_col = [end_pos[0], end_pos[1]-1]
  if less_one_row[0] >= 0
    count += helper(matrix, start_pos, less_one_row, target)
  end
  if less_one_col[1] >= 0
    count += helper(matrix, start_pos, less_one_col, target)
  end
  return count
end

def sum_all(matrix)
  sum = 0
  (0...matrix.size).each do |i|
    (0...matrix[0].size).each do |j|
      sum += matrix[i][j]
    end
  end
  return sum
end

# Example 1:


# Input: 
matrix = [[0,1,0],[1,1,1],[0,1,0]]
target = 0
# Output: 4
puts num_submatrix_sum_target(matrix, target)
# Explanation: The four 1x1 submatrices that only contain 0.

# Example 2:
# Input: 
matrix = [[1,-1],[-1,1]]
target = 0
# Output: 5
puts num_submatrix_sum_target(matrix, target)
# Explanation: The two 1x2 submatrices, plus the two 2x1 submatrices, plus the 2x2 submatrix.

# Example 3:
# Input: 
matrix = [[904]]
target = 0
# Output: 0
puts num_submatrix_sum_target(matrix, target)
 

# Constraints:

# 1 <= matrix.length <= 100
# 1 <= matrix[0].length <= 100
# -1000 <= matrix[i] <= 1000
# -10^8 <= target <= 10^8