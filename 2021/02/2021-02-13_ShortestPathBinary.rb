# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/585/week-2-february-8th-february-14th/3638/
# Shortest Path in Binary Matrix

# In an N by N square grid, each cell is either empty (0) or blocked (1).

# A clear path from top-left to bottom-right has length k if and only if it is composed of cells C_1, C_2, ..., C_k such that:

#     Adjacent cells C_i and C_{i+1} are connected 8-directionally (ie., they are different and share an edge or corner)
#     C_1 is at location (0, 0) (ie. has value grid[0][0])
#     C_k is at location (N-1, N-1) (ie. has value grid[N-1][N-1])
#     If C_i is located at (r, c), then grid[r][c] is empty (ie. grid[r][c] == 0).

# Return the length of the shortest such clear path from top-left to bottom-right.  If such a path does not exist, return -1.

# Strategy:
# Breadth-first search until reaching grid.last.last or until queue is empty (return -1)
# Set visited[i][j] to be min distance to get here
# Return visited.last.last

# Edge cases:
#   First cell is 1 => return -1
#   Last cell is 1 => return -1

# Data structures:
#   Queue for BFS
#   Array of arrays for "visited"

# Time complexity: O(n+m) where n is the number of 0's and m is the number of connected 0's
# Space complexity: O(n)
require_relative "../../DS/Queue.rb"
require "byebug"
require 'set'

DIRS = [
  [1, 1],
  [0, 1],
  [1, 0],
  [-1, 0],
  [-1, 1],
  [1, -1],
  [0, -1],
  [-1, -1],
]

# @param {Integer[][]} grid
# @return {Integer}
def shortest_path_binary_matrix(grid)
  return -1 if grid.first.first == 1
  return -1 if grid.last.last == 1

  n = grid.length - 1
  m = grid[0].length - 1

  visited = Set.new()

  counter = 1
  queue = Queue.new()
  queue.push([0, 0])
  visited.add([0,0])

  until queue.empty?
    this_layer = queue.size
    while this_layer > 0
      i, j = queue.shift
      if i == n && j == m
        return counter
      end
      neighbors = get_neighbors(grid, visited, i, j)
      neighbors.each do |neigh|
        queue << neigh
        visited.add(neigh)
      end

      this_layer -= 1
    end
    counter += 1
  end
  return -1
end

def get_neighbors(grid, visited, i, j)
  result = []
  DIRS.each do |dir|
    di, dj = dir
    new_i = i + di
    new_j = j + dj
    next if new_i < 0 || new_i >= grid.length
    next if new_j < 0 || new_j >= grid.length
    next if grid[new_i][new_j] == 1
    next if visited.include?([new_i, new_j])
    result << [new_i, new_j]
  end
  return result
end

# Example 1:

# Input:
grid = [[0, 1], [1, 0]]
puts shortest_path_binary_matrix(grid)
# Output: 2

# Example 2:

# Input:
grid = [[0, 0, 0], [1, 1, 0], [1, 1, 0]]
puts shortest_path_binary_matrix(grid)
# Output: 4

# Example 3:

# Input:
grid = [[1, 0, 0], [1, 1, 0], [1, 1, 0]]
puts shortest_path_binary_matrix(grid)
# Output: -1

# Example 4:

# Input:
grid = [
  [0, 0, 0],
  [1, 1, 0],
  [1, 1, 1],
]
puts shortest_path_binary_matrix(grid)
# Output: -1

# Example 5:

# Input:
grid = [
  [0],
]
puts shortest_path_binary_matrix(grid)
# Output: -1

# Note:

#     1 <= grid.length == grid[0].length <= 100
#     grid[r][c] is 0 or 1
