# https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/548/week-5-july-29th-july-31st/3407/

# @param {Integer} n
# @return {Integer}
require "byebug"

def climb_stairs(n)
  cache = Array.new(n + 1)
  cache[0] = 1
  cache[1] = 1

  helper(n, cache)
end

def helper(n, cache)
  return cache[n] if cache[n]
  cache[n] = helper(n - 1, cache) + helper(n - 2, cache)
end

p climb_stairs(3)
p climb_stairs(10)
# n=3 => [[1,1,1], [1,2], [2,1]]
# n=4 => [[1,1,1,1], [1,1,2], [1,2,1], [2,1,1], [2,2]]
