# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/584/week-1-february-1st-february-7th/3624/
# Squirrel Simulation
# There's a tree, a squirrel, and several nuts. Positions are represented by the cells in a 2D grid. Your goal is to find the minimal distance for the squirrel to collect all the nuts and put them under the tree one by one. The squirrel can only take at most one nut at one time and can move in four directions - up, down, left and right, to the adjacent cell. The distance is represented by the number of moves.
require "byebug"
# @param {Integer} height
# @param {Integer} width
# @param {Integer[]} tree
# @param {Integer[]} squirrel
# @param {Integer[][]} nuts
# @return {Integer}
def min_distance(height, width, tree, squirrel, nuts)
  dist = 0
  d = -Float::INFINITY

  nuts.each do |nut|
    dist += dist(nut, tree) * 2
    d = [d, dist(nut, tree) - dist(nut, squirrel)].max
  end

  return dist - d
end



# def min_distance(height, width, tree, squirrel, nuts)
#   dist = 0
#   farthest_dist, farthest_idx = get_closest_to_sq(squirrel, nuts, tree)

#   dist += farthest_dist
#   nuts.delete_at(farthest_idx)

#   nuts.inject(dist) { |sum, nut| sum + dist(tree, tree, nut) }
# end

# def get_closest_to_sq(squirrel, nuts, tree)
#   farthest_so_far = dist(squirrel, nuts[0]) - dist(tree, nuts[0])
#   farthest_idx = 0

#   (1...nuts.size).each do |i|
#     nut = nuts[i]
#     this_dist = dist(tree, squirrel, nut)
#     if this_dist > farthest_so_far
#       farthest_so_far = this_dist
#       farthest_idx = i
#     end
#   end
#   farthest_dist = farthest_so_far
#   return [farthest_dist, farthest_idx]
# end

def dist(a, b)
  (a[0] - b[0]).abs + (a[1] - b[1]).abs
end

# Example 1:

# Input:
height = 5
width = 7
tree = [2, 2]
squirrel = [4, 4]
nuts = [[3, 0], [2, 5]]
# Output: 12
# Explanation:
# ​​​​​
puts min_distance(height, width, tree, squirrel, nuts)

# Example 2:

# Input:
height = 1
width = 3
tree = [0, 1]
squirrel = [0, 0]
nuts = [[0, 2]]
# Output: 3
puts min_distance(height, width, tree, squirrel, nuts)

# Example 3:

# Input:
height = 5
width = 7
tree = [2, 2]
squirrel = [4, 4]
nuts = [[3, 0], [2, 5]]
# Output: 12
puts min_distance(height, width, tree, squirrel, nuts)

# Example 4:

# Input:
height = 5
width = 5
tree = [3, 2]
squirrel = [0, 1]
nuts = [[2, 0], [4, 1], [0, 4], [1, 3], [1, 0], [3, 4], [3, 0], [2, 3], [0, 2], [0, 0], [2, 2], [4, 2], [3, 3], [4, 4], [4, 0], [4, 3], [3, 1], [2, 1], [1, 4], [2, 4]]
# Output: 100
puts min_distance(height, width, tree, squirrel, nuts)

# Note:

#     All given positions won't overlap.
#     The squirrel can take at most one nut at one time.
#     The given positions of nuts have no order.
#     Height and width are positive integers. 3 <= height * width <= 10,000.
#     The given positions contain at least one nut, only one tree and one squirrel.
