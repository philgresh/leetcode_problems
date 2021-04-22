# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/595/week-3-april-15th-april-21st/3715/
# Triangle
# Given a triangle array, return the minimum path sum from top to bottom.

# For each step, you may move to an adjacent number of the row below. More formally, if you are on index 
# i on the current row, you may move to either index i or index i + 1 on the next row.

# @param {Integer[][]} triangle
# @return {Integer}
def minimum_total(triangle)
  top_row = triangle[0]
  bottom_row = triangle[0]
  
  (1...triangle.size).each do |i|
    bottom_row = triangle[i]
    (0...bottom_row.size).each do |j|
      above = []
      above << top_row[j] if j < i
      above << top_row[j-1] if j > 0
      bottom_row[j] += above.min
    end
    top_row = bottom_row
  end

  return bottom_row.min
end

# Example 1:

# Input: 
triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
# Output: 11
puts minimum_total(triangle)
# Explanation: The triangle looks like:
# 2
# 3 4
# 6 5 7
# 4 1 8 3
# The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).


# Example 2:
# Input: 
triangle = [[-10]]
# Output: -10
puts minimum_total(triangle)

# Constraints:

# 1 <= triangle.length <= 200
# triangle[0].length == 1
# triangle[i].length == triangle[i - 1].length + 1
# -104 <= triangle[i][j] <= 104
 

# Follow up: Could you do this using only O(n) extra space, where n is the total number of rows in the triangle?