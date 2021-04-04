# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/592/week-5-march-29th-march-31st/3690/
# Russian Doll Envelopes
# You are given a 2D array of integers envelopes where envelopes[i] = [wi, hi] represents the width and the height of an envelope.

# One envelope can fit into another if and only if both the width and height of one envelope is greater than the width and height of the other envelope.

# Return the maximum number of envelopes can you Russian doll (i.e., put one inside the other).

# Note: You cannot rotate an envelope.

# Strategy:
# Sort smallest to largest
# Set up dp = Array of same size, filled with 1
# Iterate through envelopes starting at 1
#   Set dp[i] to the max of the dp of all previous envelopes smaller than it
# Return the last dp

# Time complexity: O(n**2)
# Space complexity: O(n)
require 'byebug'
# @param {Integer[][]} envelopes
# @return {Integer}
def max_envelopes(envelopes)
  envelopes.sort! do |a,b|
    if a[0] == b[0]
      b[1] <=> a[1] 
    else 
      a[0] <=> b[0]
    end
  end

  dp = Array.new(envelopes.size)
  dp[0] = 1

  (1...envelopes.size).each do |i|
    max = 1
    (0...i).each do |j|
      if is_smaller?(envelopes, i, j)
        max = [dp[j] + 1, max].max
      end
    end
    dp[i] = [max, dp[i-1]].max
  end
  return dp.last
end

def is_smaller?(envelopes, i, j)
  envelopes[i][0] > envelopes[j][0] && envelopes[i][1] > envelopes[j][1]
end

# Example 1:
# Input: 
envelopes = [[5,4],[6,4],[6,7],[2,3]]
# Output: 3
puts max_envelopes(envelopes)
# Explanation: The maximum number of envelopes you can Russian doll is 3 ([2,3] => [5,4] => [6,7]).

# Example 2:
# Input: 
envelopes = [[1,1],[1,1],[1,1]]
# Output: 1
puts max_envelopes(envelopes)

# Example 3:
# Input: 
envelopes = [[10,8],[1,12],[6,15],[2,18]]
# Output: 2
debugger
puts max_envelopes(envelopes)

# Constraints:

# 1 <= envelopes.length <= 5000
# envelopes[i].length == 2
# 1 <= wi, hi <= 104