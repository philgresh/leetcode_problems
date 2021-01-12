# https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/572/week-4-december-22nd-december-28th/3582/

# Jump Game IV

# Given an array of integers arr, you are initially positioned at the first index of the array.

# In one step you can jump from index i to index:

#     i + 1 where: i + 1 < arr.length.
#     i - 1 where: i - 1 >= 0.
#     j where: arr[i] == arr[j] and i != j.

# Constraints:

#     1 <= arr.length <= 5 * 10^4
#     -10^8 <= arr[i] <= 10^8

#
require "byebug"
# @param {Integer[]} arr
# @return {Integer}
# def min_jumps(arr)
#   return 0 if arr.size <= 1
#   return 1 if arr.first == arr.last

#   dp = setup_dp(arr)
#   return dp.last
# end

# def setup_dp(arr)
#   # Iterate over arr
#   # Record min jumps for each
#   dict = Hash.new { |h, k| h[k] = [] }
#   arr.each_with_index { |ele, i| dict[ele] << i }

#   dp = Array.new(arr.size) { |i| i }

#   (0...arr.size).each do |i|
#     curr = arr[i]
#     prev = i > 0 ? dp[i - 1] + 1 : dp[i]
#     nxt = i < arr.size - 1 ? dp[i + 1] + 1 : dp[i]
#     dp[i] = [prev, dp[i], nxt].min

#     (1...dict[curr].size).each do |j|
#       idx = dict[curr][j]
#       dp[idx] = [dp[i] + 1, dp[idx]].min
#     end
#   end

#   return dp
# end
require "set"

def min_jumps(arr)
  arr_count = arr.count

  graph = Hash.new { |h, k| h[k] = [] }
  arr_count.times do |i|
    graph[arr[i]] << i
  end

  src = 0
  dest = arr_count - 1

  visited = Set.new
  visited << src

  queue = []
  queue << [src, 0]

  until queue.empty?
    node, dist = queue.shift
    return dist if node == dest

    ([node - 1, node + 1] + graph[arr[node]].reverse).each do |child|
      if 0 <= child &&
         child < arr_count &&
         child != node &&
         !visited.include?(child)
        visited << child
        return dist + 1 if child == dest
        queue << [child, dist + 1]
      end
    end
  end

  -1
end

# Return the minimum number of steps to reach the last index of the array.

# Notice that you can not jump outside of the array at any time.

# Example 1:

# Input:
arr = [100, -23, -23, 404, 100, 23, 23, 23, 3, 404]
# Output: 3
puts min_jumps(arr)
# Explanation: You need three jumps from index 0 --> 4 --> 3 --> 9. Note that index 9 is the last index of the array.

# Example 2:

# Input:
arr = [7]
# Output: 0
puts min_jumps(arr)
# Explanation: Start index is the last index. You don't need to jump.

# Example 3:

# Input:
arr = [7, 6, 9, 6, 9, 6, 9, 7]
# Output: 1
puts min_jumps(arr)
# Explanation: You can jump directly from index 0 to index 7 which is last index of the array.

# Example 4:

# Input:
arr = [6, 1, 9]
# Output: 2
puts min_jumps(arr)

# Example 5:

# Input:
arr = [11, 22, 7, 7, 7, 7, 7, 7, 7, 22, 13]
# Output: 3
puts min_jumps(arr)
