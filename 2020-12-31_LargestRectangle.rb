# https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/573/week-5-december-29th-december-31st/3587/
# Largest Rectangle in Histogram

# Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.

# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
  stack = [-1]
  maxArea = 0
  (0...heights.size).each do |i|
    while stack.last != -1 && heights[stack.last] >= heights[i]
      lastElementIdx = stack.pop()
      heightAtThisLevel = heights[lastElementIdx] * (i - stack[-1] - 1)
      maxArea = [maxArea, heightAtThisLevel].max
    end
    stack << i
  end
  while stack.last != -1
    lastElementIdx = stack.pop()
    heightAtThisLevel = heights[lastElementIdx] * (heights.size - stack[-1] - 1)
    maxArea = [maxArea, heightAtThisLevel].max
  end
  maxArea
end

# Example:

# Input:
heights = [2, 1, 5, 6, 2, 3]
puts largest_rectangle_area(heights)
# Output: 10
