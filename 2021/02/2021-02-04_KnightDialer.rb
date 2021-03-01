# https://leetcode.com/problems/knight-dialer/
# 935. Knight Dialer
# Medium

# The chess knight has a unique movement, it may move two squares vertically
# and one square horizontally, or two squares horizontally and one square vertically (with
# both forming the shape of an L). The possible movements of chess knight are shown in this diagaram:

# A chess knight can move as indicated in the chess diagram below:

# We have a chess knight and a phone pad as shown below, the knight can only stand on a numeric cell (i.e. blue cell).

# Given an integer n, return how many distinct phone numbers of length n we can dial.

# You are allowed to place the knight on any numeric cell initially and then you should perform n - 1 jumps to dial a number of length n. All jumps should be valid knight jumps.

# As the answer may be very large, return the answer modulo 109 + 7.

# Strategy:
# Intially determine spaces from which a knight may travel given a starting position.
# For each space in a number (starting with each of 0-9):
#   Given a starting location from previous, count how many numbers a knight may move to
#   Multiply the sum by that amount and add that number new_prev
#   prev = new_prev
require "byebug"
require "set"

MOD = (10 ** 9 + 7)

# @param {Integer} n
# @return {Integer}
def knight_dialer(n)
  return 10 if n == 1
  prev = Set.new((0..9).to_a)
  count = (0..9).to_a.fill(1)
  count[5] = 0

  knight_moves = get_knight_moves

  (n - 1).times do
    new_prev = Set.new([])

    prev.each do |initial_pos|
      new_moves = knight_moves[initial_pos]
      next if new_moves.empty?
      new_prev.merge(new_moves)
      count[initial_pos] += new_moves.size
    end
    prev = new_prev
  end
  debugger

  return count.sum % MOD
end

def get_knight_moves
  return {
           1 => [6, 8],
           2 => [7, 9],
           3 => [4, 8],
           4 => [3, 9, 0],
           5 => [],
           6 => [1, 7, 0],
           7 => [2, 6],
           8 => [1, 3],
           9 => [2, 4],
           0 => [4, 6],
         }
end

# Example 1:

# Input:
n = 1
# Output: 10
# puts knight_dialer(n)
# Explanation: We need to dial a number of length 1, so placing the knight over any numeric cell of the 10 cells is sufficient.

# Example 2:

# Input:
n = 2
# Output: 20
# puts knight_dialer(n)

# Explanation: All the valid number we can dial are [04, 06, 16, 18, 27, 29, 34, 38, 40, 43, 49, 60, 61, 67, 72, 76, 81, 83, 92, 94]

# Example 3:

# Input:
n = 3
# Output: 46
# puts knight_dialer(n)

# Example 4:

# Input:
n = 4
# Output: 104
# puts knight_dialer(n)

# Example 5:

# Input:
n = 3131
# Output: 136006598
puts knight_dialer(n)

# Explanation: Please take care of the mod.

# Constraints:

#     1 <= n <= 5000
