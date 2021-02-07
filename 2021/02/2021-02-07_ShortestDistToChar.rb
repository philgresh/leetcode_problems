# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/584/week-1-february-1st-february-7th/3631/
# Shortest Distance to a Character

# Given a string s and a character c that occurs in s, return an array of
# integers answer where answer.length == s.length and answer[i] is the
# shortest distance from s[i] to the character c in s.
require "byebug"
# @param {String} s
# @param {Character} c
# @return {Integer[]}
def shortest_to_char(s, c)
  # Create dp array of same length, fill with Infinity
  # Iterate through s forwards and then backwards
  #   Once you come across a char == c, set dp[i] = 0
  #   going forward: dp[i] = min[dp[i], dp[i-1]+1]

  n = s.size
  dp = Array.new(n).fill(n - 1)

  (0...n).each do |i|
    if s[i] == c
      dp[i] = 0
    elsif i == 0
      dp[i] = [dp[i], n - 1].min
    else
      dp[i] = [dp[i], dp[i - 1] + 1].min
    end
  end

  (n - 1).downto(0).each do |i|
    if s[i] == c
      dp[i] = 0
    elsif i == n - 1
      dp[i] = [dp[i], n - 1].min
    else
      dp[i] = [dp[i], dp[i + 1] + 1].min
    end
  end
  return dp
end

# Example 1:

# Input:
s = "loveleetcode"
c = "e"
# Output: [3,2,1,0,1,0,0,1,2,2,1,0]
puts shortest_to_char(s, c).to_s

# Example 2:

# Input:
s = "aaab"
c = "b"
# Output: [3,2,1,0]
puts shortest_to_char(s, c).to_s

# Example 3:

# Input:
s = "baaa"
c = "b"
# Output: [0,1,2,3]
puts shortest_to_char(s, c).to_s

# Example 4:

# Input:
s = "b"
c = "b"
# Output: [0]
puts shortest_to_char(s, c).to_s

# Example 5:

# Input:
s = "aaba"
c = "b"
# Output: [2,1,0,1]
puts shortest_to_char(s, c).to_s

# Constraints:

#     1 <= s.length <= 104
#     s[i] and c are lowercase English letters.
#     c occurs at least once in s.
