# Pacific Atlantic Water Flow
# Given an m x n matrix of non-negative integers representing the height of each unit cell in a continent, the "Pacific ocean" touches the left and top edges of the matrix and the "Atlantic ocean" touches the right and bottom edges.

# Water can only flow in four directions (up, down, left, or right) from a cell to another one with height equal or lower.

# Find the list of grid coordinates where water can flow to both the Pacific and Atlantic ocean.

# Note:

# The order of returned grid coordinates does not matter.
# Both m and n are less than 150.

# @param {Integer[][]} matrix
# @return {Integer[][]}
def pacific_atlantic(matrix)
  return matrix if !matrix
  x = matrix[0].size
  y = matrix.size

  answer = []
  dp = Array.new(y) { Array.new(x).fill(0) }
  (0...y).each do |i|
    dfs(i, 0, 1, matrix[i][0], answer, x, y, dp)
    dfs(i, x-1, 2, matrix[i][x-1], answer, x, y, dp)
  end
  (0...x).each do |j|
    dfs(0, j, 1, matrix[0][j], answer, x, y, dp)
    dfs(y-1, j, 2, matrix[y-1][j], answer, x, y, dp)
  end
  return answer
end

def dfs(i, j, w, h, answer, x, y, dp)
  ij = i * x + j
  return if dp[ij] & w || matrix[i][j] < h
  dp[ij] += w
  h = matrix[i][j]
  answer << [i, j] if dp[ij] == 3
  dfs(i + 1, j, w, h, answer, x, y, dp) if i + 1 < y
  dfs(i - 1, j, w, h, answer, x, y, dp)   if i > 0
  dfs(i, j+1, w, h, answer, x, y, dp)   if j + 1 < x
  dfs(i, j-1, w, h, answer, x, y, dp)   if j > 0
end

# Example:

# Given the following 5x5 matrix:
matrix = [
  [1, 2, 2, 3, 5],
  [3, 2, 3, 4, 4],
  [2, 4, 5, 3, 1],
  [6, 7, 1, 4, 5],
  [5, 1, 1, 2, 4]
]

#   Pacific ~   ~   ~   ~   ~ 
#        ~  1   2   2   3  (5) *
#        ~  3   2   3  (4) (4) *
#        ~  2   4  (5)  3   1  *
#        ~ (6) (7)  1   4   5  *
#        ~ (5)  1   1   2   4  *
#           *   *   *   *   * Atlantic

# Return:
puts pacific_atlantic(matrix)
# [[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]] (positions with parentheses in above matrix).