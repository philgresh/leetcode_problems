# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/590/week-3-march-15th-march-21st/3675/
# Generate Random Point in a Circle
# Given the radius and x-y positions of the center of a circle, write a function randPoint which generates a 
# uniform random point in the circle.

# Note:

# input and output values are in floating-point.
# radius and x-y position of the center of the circle is passed into the class constructor.
# a point on the circumference of the circle is considered to be in the circle.
# randPoint returns a size 2 array containing x-position and y-position of the random point, in that order.
# Example 1:
require 'byebug'
class Solution
  def initialize(radius, x_center, y_center)
    @radius = radius
    @origin = [x_center, y_center]
  end

  def rand_point()
    while
      point = gen_rand_point()
      return point if within_circle(point)
    end
  end

  private

  def gen_rand_point()
    right_edge = (@origin[0] + @radius) * 1.0
    left_edge = (@origin[0] - @radius) * 1.0
    top_edge = (@origin[1] + @radius) * 1.0
    bottom_edge = (@origin[1] - @radius) * 1.0
    rand_x = Random.rand(left_edge..right_edge)
    rand_y = Random.rand(bottom_edge..top_edge)
    return [rand_x, rand_y]
  end

  def within_circle(point)
    x, y = point
    x_center, y_center = @origin
    Math.sqrt((x - x_center)**2 + (y - y_center)**2) <= @radius
  end
end
  
  # Your Solution object will be instantiated and called as such:
  # obj = Solution.new(radius, x_center, y_center)
  # param_1 = obj.rand_point()

# Input: 
# ["Solution","randPoint","randPoint","randPoint"]
radius, x_center, y_center = [1,0,0]
obj = Solution.new(radius, x_center, y_center)
# [[1,0,0],[],[],[]]
puts obj.rand_point()
puts obj.rand_point()
puts obj.rand_point()
# Output: [null,[-0.72939,-0.65505],[-0.78502,-0.28626],[-0.83119,-0.19803]]
# Example 2:

# Input: 
# ["Solution","randPoint","randPoint","randPoint"]
# [[10,5,-7.5],[],[],[]]
# Output: [null,[11.52438,-8.33273],[2.46992,-16.21705],[11.13430,-12.42337]]
# Explanation of Input Syntax:

# The input is two lists: the subroutines called and their arguments. Solution's constructor has three arguments, 
# the radius, x-position of the center, and y-position of the center of the circle. randPoint has no arguments. 
# Arguments are always wrapped with a list, even if there aren't any.