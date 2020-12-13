# https://leetcode.com/problems/minimum-path-sum/

# 64. Minimum Path Sum
# Medium

# Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.

# Note: You can only move either down or right at any point in time.

# Set up a second grid of same size, which will keep track of summed_paths to that point
# Iterate through the grid starting from 1,1
#   Add to summed_paths the current to min([i-1,j] and [i,j-1])
# Return the bottom-right square of summed_paths

# Edge cases: 1x1 grid

# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  summed_paths = grid.map { |row| row.dup }
  (1...summed_paths[0].size).each do |j|
    # Set up first row
    summed_paths[0][j] += summed_paths[0][j - 1]
  end
  (1...grid.size).each do |i|
    # Set up first col
    summed_paths[i][0] += summed_paths[i - 1][0]
  end

  (1...summed_paths.size).each do |i|
    (1...summed_paths[i].size).each do |j|
      up = summed_paths[i - 1][j]
      left = summed_paths[i][j - 1]
      curr = summed_paths[i][j]
      summed_paths[i][j] = [curr + up, curr + left].min
    end
  end

  return summed_paths[-1][-1]
end

# Example 1:

# Input:
grid = [[1, 3, 1], [1, 5, 1], [4, 2, 1]]
puts min_path_sum(grid) # 7
# Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.

# Example 2:

# Input:
grid = [[1, 2, 3], [4, 5, 6]]
puts min_path_sum(grid) # 12

# Constraints:

#     m == grid.length
#     n == grid[i].length
#     1 <= m, n <= 200
#     0 <= grid[i][j] <= 100
