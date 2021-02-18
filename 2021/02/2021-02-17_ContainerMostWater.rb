# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/586/week-3-february-15th-february-21st/3643/
# Container With Most Water

# Given n non-negative integers a1, a2, ..., an , where each represents a point at
# coordinate (i, ai). n vertical lines are drawn such that the two endpoints of
# the line i is at (i, ai) and (i, 0). Find two lines, which, together with the
# x-axis forms a container, such that the container contains the most water.

# Notice that you may not slant the container.

# Strategy:
# Set pointers at either end
# Move pointers in: If height[i] > height[j], move in j, etc
# Calculate current volume and compare against max_so_far, reassign if greater
# Return max_so_far when pointers align

# Edge cases:
#   height is length 2 => should be satisfied by algorithm
#

# Time complexity: O(n)
# Space complexity: O(1)
require "byebug"
# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  i = 0
  j = height.size - 1
  max_so_far = 0

  while i < j
    curr_volume = [height[j], height[i]].min * (j - i)
    max_so_far = [max_so_far, curr_volume].max
    if height[i] < height[j]
      i += 1
    else
      j -= 1
    end
  end
  max_so_far
end

# Example 1:

# Input:
height = [1, 8, 6, 2, 5, 4, 8, 3, 7]
# Output: 49
puts max_area(height)
# Explanation: The above vertical lines are represented by array
# [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section)
# the container can contain is 49.

# Example 2:

# Input:
height = [1, 1]
# Output: 1
puts max_area(height)

# Example 3:

# Input:
height = [4, 3, 2, 1, 4]
# Output: 16
puts max_area(height)

# Example 4:

# Input:
height = [1, 2, 1]
# Output: 2
puts max_area(height)

# Constraints:

#     n == height.length
#     2 <= n <= 3 * 104
#     0 <= height[i] <= 3 * 104
