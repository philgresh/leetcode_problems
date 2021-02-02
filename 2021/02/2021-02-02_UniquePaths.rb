# https://leetcode.com/problems/unique-paths/
# 62. Unique Paths
# Medium

# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

# How many possible unique paths are there?

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  dp = Array.new(m) { Array.new(n).fill(1) }
  (1...m).each do |i|
    (1...n).each do |j|
      up = dp[i-1][j]
      left = dp[i][j-1]
      dp[i][j] = up + left
    end
  end
  return dp.last.last
end

# Example 1:

# Input:
m = 3
n = 7
# Output: 28
puts unique_paths(m, n)

# Example 2:

# Input:
m = 3
n = 2
# Output: 3
puts unique_paths(m, n)

# Explanation:
# From the top-left corner there are a total of 3 ways to reach the bottom-right corner:
# 1. Right -> Down -> Down
# 2. Down -> Down -> Right
# 3. Down -> Right -> Down

# Example 3:

# Input:
m = 7
n = 3
# Output: 28
puts unique_paths(m, n)

# Example 4:

# Input:
m = 3
n = 3
# Output: 6
puts unique_paths(m, n)

# Constraints:

#     1 <= m, n <= 100
#     It's guaranteed that the answer will be less than or equal to 2 * 109.
