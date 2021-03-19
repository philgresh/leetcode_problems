# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/590/week-3-march-15th-march-21st/3677/
# Keys and Rooms
# There are N rooms and you start in room 0.  Each room has a distinct number in 0, 1, 2, ..., N-1, 
# and each room may have some keys to access the next room. 

# Formally, each room i has a list of keys rooms[i], and each key rooms[i][j] is an integer in 
# [0, 1, ..., N-1] where N = rooms.length.  A key rooms[i][j] = v opens the room with number v.

# Initially, all the rooms start locked (except for room 0). 

# You can walk back and forth between rooms freely.

# Return true if and only if you can enter every room.

# Strategy:
#  Set up an array of same size as rooms to keep track if we've visited it
#  DFS - Set up a stack of rooms to visit, starting with room 0
#  Iterate through the stack, adding keys to the hash and adding those rooms to the stack if we haven't visited them
#  When stack is empty, check to see if all the rooms have been visited

# Data structures:
#  Stack for DFS
#  Array for visited rooms

# Time complexity: O(rooms + keys)
# Space complexity: O(rooms + keys)

# @param {Integer[][]} rooms
# @return {Boolean}
def can_visit_all_rooms(rooms)
  visited = Array.new(rooms.size).fill(false)
  stack = [0]
  until stack.empty?
    curr = stack.pop
    if !visited[curr]
      rooms[curr].each { |key| stack << key if !visited[key] }
      visited[curr] = true
    end
  end
  return visited.all?
end

# Example 1:

# Input: 
rooms = [[1],[2],[3],[]]
# Output: true
puts can_visit_all_rooms(rooms)

# Explanation:  
# We start in room 0, and pick up key 1.
# We then go to room 1, and pick up key 2.
# We then go to room 2, and pick up key 3.
# We then go to room 3.  Since we were able to go to every room, we return true.
# Example 2:

# Input: 
rooms = [[1,3],[3,0,1],[2],[0]]
# Output: false
puts can_visit_all_rooms(rooms)
# Explanation: We can't enter the room with number 2.
# Note:

# 1 <= rooms.length <= 1000
# 0 <= rooms[i].length <= 1000
# The number of keys in all rooms combined is at most 3000.