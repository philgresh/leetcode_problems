# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/594/week-2-april-8th-april-14th/3703/
# Longest Increasing Path in a Matrix
# Given an m x n integers matrix, return the length of the longest increasing path in matrix.

# From each cell, you can either move in four directions: left, right, up, or down. 
# You may not move diagonally or move outside the boundary (i.e., wrap-around is not allowed).

# Strategy:
# DP = same size as matrix, stores longest path from that cell, fill with 0
# Iterate through matrix and DFS as long as the neighboring cell is increasing
#   If a cell has already been visited (DP[i][j] != 0) then use that value
#   Keep track of max-so-far
require 'byebug'
DIRS = [
  [-1, 0],
  [0, 1],
  [1, 0],
  [0, -1]
]
# @param {Integer[][]} matrix
# @return {Integer}
def longest_increasing_path(matrix)
  dp = Array.new(matrix.size) { Array.new(matrix[0].size, 0) }
  max_so_far = [1]

  matrix.each.with_index do |row, i|
    row.each.with_index do |cell, j|
      next if dp[i][j] > 0
      bfs(matrix, i, j, dp, max_so_far)
    end
  end
  return max_so_far[0]
end

def bfs(matrix, i, j, dp, max_so_far)
  return dp[i][j] if dp[i][j] > 0
  next_path_len = 1
  neighs = get_neighbors(matrix, i, j)
  neighs.each do |new_i, new_j| 
    next_path_len = [next_path_len, bfs(matrix, new_i, new_j, dp, max_so_far)+1].max
  end
  dp[i][j] = next_path_len
  max_so_far[0] = [max_so_far[0], next_path_len].max
  return next_path_len 
end

def get_neighbors(matrix, i, j)
  neighs = []
  DIRS.each do |di, dj|
    new_i = i + di
    new_j = j + dj
    next if new_i < 0 || new_i == matrix.size
    next if new_j < 0 || new_j == matrix[0].size
    next if matrix[new_i][new_j] <= matrix[i][j]
    neighs << [new_i, new_j]
  end
  return neighs
end

# Example 1:
# Input: 
matrix = [[9,9,4],[6,6,8],[2,1,1]]
# Output: 4
puts longest_increasing_path(matrix).to_s
# Explanation: The longest increasing path is [1, 2, 6, 9].


# Example 2:
# Input: 
matrix = [[3,4,5],[3,2,6],[2,2,1]]
# Output: 4
puts longest_increasing_path(matrix).to_s
# Explanation: The longest increasing path is [3, 4, 5, 6]. Moving diagonally is not allowed.


# Example 3:
# Input: 
matrix = [[1]]
# Output: 1
puts longest_increasing_path(matrix).to_s
 


# Constraints:

# m == matrix.length
# n == matrix[i].length
# 1 <= m, n <= 200
# 0 <= matrix[i][j] <= 231 - 1