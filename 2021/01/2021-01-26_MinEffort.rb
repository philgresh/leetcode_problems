# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/582/week-4-january-22nd-january-28th/3617/

# Path With Minimum Effort

# You are a hiker preparing for an upcoming hike. You are given heights, a 2D array of size rows x columns, where heights[row][col] represents the height of cell (row, col). You are situated in the top-left cell, (0, 0), and you hope to travel to the bottom-right cell, (rows-1, columns-1) (i.e., 0-indexed). You can move up, down, left, or right, and you wish to find a route that requires the minimum effort.

# A route's effort is the maximum absolute difference in heights between two consecutive cells of the route.

# Return the minimum effort required to travel from the top-left cell to the bottom-right cell.

# class Node
#   attr_accessor :val, :next, :weight
#   def initialize(val, next_node=nil, weight=Float::INFINITY)
#     @val = val
#     @next = next_node
#     @weight = weight
#   end

#   def self.graphify(arr)
#     head = Node.new(nil)
#     arr.each do |row|

#     end
#   end
# end
require "set"
require_relative "../../DS/PriorityQueue.rb"
require "byebug"
# @param {Integer[][]} heights
# @return {Integer}
def minimum_effort_path(heights)
  dijkstra(heights)
end

def dijkstra(heights)
  m = heights.size
  n = heights.last.size
  visited = heights.map { |row| Array.new(row.size).fill(false) }

  comparison_func = Proc.new { |a, b| a[0] <=> b[0] }
  first_val = [0, 0, 0]  # qu will hold vals in form [effort, i, j] and prioritize by highest effort

  heap = PriorityQueue.new([first_val], &comparison_func)
  max_effort = 0

  until heap.empty?
    new_effort, x, y = heap.pop
    next if visited[x][y]
    visited[x][y] = true
    max_effort = [max_effort, new_effort].max

    return max_effort if target_reached?(heights, x, y)
    neighbors(heights, visited, x, y).each do |neighbor|
      new_effort = effort(heights, [x, y], neighbor)
      heap.push([new_effort, *neighbor])
    end
  end
end

def acceptable?(heights, visited, x, y)
  return false if x < 0 || y < 0
  return false if x >= heights.size || y >= heights.last.size
  return !visited[x][y]
end

def neighbors(heights, visited, x, y)
  dirs = [
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1],
  ]
  result = []
  dirs.each do |dx, dy|
    new_x = x + dx
    new_y = y + dy
    result << [new_x, new_y] if acceptable?(heights, visited, x, y)
  end
  return result
end

def effort(heights, pos1, pos2)
  (heights[pos1[0]][pos1[1]] - heights[pos2[0]][pos2[1]]).abs
end

def target_reached?(heights, x, y)
  debugger
  x == heights.size - 1 && y == heights[0].size - 1
end

# Example 1:

# Input:
heights = [[1, 2, 2], [3, 8, 2], [5, 3, 5]]
# Output: 2
puts minimum_effort_path(heights)
# Explanation: The route of [1,3,5,3,5] has a maximum absolute difference of 2 in consecutive cells.
# This is better than the route of [1,2,2,2,5], where the maximum absolute difference is 3.

# Example 2:

# Input:
heights = [[1, 2, 3], [3, 8, 4], [5, 3, 5]]
# Output: 1
puts minimum_effort_path(heights)

# Explanation: The route of [1,2,3,4,5] has a maximum absolute difference of 1 in consecutive cells, which is better than route [1,3,5,3,5].

# Example 3:

# Input:
heights = [[1, 2, 1, 1, 1], [1, 2, 1, 2, 1], [1, 2, 1, 2, 1], [1, 2, 1, 2, 1], [1, 1, 1, 2, 1]]
# Output: 0
puts minimum_effort_path(heights)
# Explanation: This route does not require any effort.

# Constraints:

#     rows == heights.length
#     columns == heights[i].length
#     1 <= rows, columns <= 100
#     1 <= heights[i][j] <= 106
