# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/596/week-4-april-22nd-april-28th/3717/
# Brick Wall
# There is a brick wall in front of you. The wall is rectangular and has several rows of bricks. 
# The bricks have the same height but different width. You want to draw a vertical line from the top 
# to the bottom and cross the least bricks.

# The brick wall is represented by a list of rows. Each row is a list of integers representing the
#  width of each brick in this row from left to right.

# If your line go through the edge of a brick, then the brick is not considered as crossed. You 
# need to find out how to draw the line to cross the least bricks and return the number of crossed bricks.

# You cannot draw a line just along one of the two vertical edges of the wall, in which case the 
# line will obviously cross no bricks.

# @param {Integer[][]} wall
# @return {Integer}
# def least_bricks(wall)
#   gap = Array.new(wall[0].sum-1, 0)
#   wall.each do |row|
#     new_gap = gap.dup
#     i = 0
#     (0...row.size).each do |j|
#       (1..(j + row[j]))
#     end
#     gap = new_gap
#   end
# end
public class Solution {
    public int leastBricks(List < List < Integer >> wall) {
        HashMap < Integer, Integer > map = new HashMap < > ();
        for (List < Integer > row: wall) {
            int sum = 0;
            for (int i = 0; i < row.size() - 1; i++) {
                sum += row.get(i);
                if (map.containsKey(sum))
                    map.put(sum, map.get(sum) + 1);
                else
                    map.put(sum, 1);
            }
        }
        int res = wall.size();
        for (int key: map.keySet())
            res = Math.min(res, wall.size() - map.get(key));
        return res;
    }
}

# Example:

# Input: 
wall = [
  [1,2,2,1],
  [3,1,2],
  [1,3,2],
  [2,4],
  [3,1,2],
  [1,3,1,1]
]
puts least_bricks(wall)
# Output: 2
 

# Note:

# The width sum of bricks in different rows are the same and won't exceed INT_MAX.
# The number of bricks in each row is in range [1,10,000]. The height of wall is in range [1,10,000]. Total number of bricks of the wall won't exceed 20,000.