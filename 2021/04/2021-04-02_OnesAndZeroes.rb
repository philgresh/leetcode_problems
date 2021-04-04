# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/593/week-1-april-1st-april-7th/3694/
# Ones and Zeroes

# You are given an array of binary strings strs and two integers m and n.

# Return the size of the largest subset of strs such that there are at most m 0's and n 1's in the subset.

# A set x is a subset of a set y if all elements of x are also elements of y.

# @param {String[]} strs
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def find_max_form(strs, m, n)
  dp = Array.new(m+1) { Array.new(n+1, 0) }

  strs.each do |str|
    count = count_zeroes_ones(str)
    m.downto(count[0]).each do |zeroes|
      n.downto(count[1]).each do |ones|
        dp[zeroes][ones] = [1 + dp[zeroes - count[0]][ones-count[1]], dp[zeroes][ones]].max
      end
    end
  end
  return dp.last.last
end

def count_zeroes_ones(str)
  count = Array.new(2, 0)
  str.each_char do |char|
    count[0] += 1 if char == '0'
    count[1] += 1 if char == '1'
  end
  return count
end
# Example 1:
# Input: 
strs = ["10","0001","111001","1","0"]
m = 5
n = 3
# Output: 4
puts find_max_form(strs, m, n)
# Explanation: The largest subset with at most 5 0's and 3 1's is {"10", "0001", "1", "0"}, so the answer is 4.
# Other valid but smaller subsets include {"0001", "1"} and {"10", "1", "0"}.
# {"111001"} is an invalid subset because it contains 4 1's, greater than the maximum of 3.

# Example 2:
# Input: 
strs = ["10","0","1"]
m = 1
n = 1
# Output: 2
puts find_max_form(strs, m, n)
# Explanation: The largest subset is {"0", "1"}, so the answer is 2.



# Constraints:

#     1 <= strs.length <= 600
#     1 <= strs[i].length <= 100
#     strs[i] consists only of digits '0' and '1'.
#     1 <= m, n <= 100

