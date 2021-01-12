# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/579/week-1-january-1st-january-7th/3591/

# Beautiful Arrangement

# Suppose you have n integers from 1 to n. We define a beautiful arrangement as 
# an array that is constructed by these n numbers successfully if one of the
#  following is true for the ith position (1 <= i <= n) in this array:

#     The number at the ith position is divisible by i.
#     i is divisible by the number at the ith position.

# Given an integer n, return the number of the beautiful arrangements that 
# you can construct.

# Constraints:

#     1 <= n <= 15

#         num
#       1 2 3 4
# i  1  1 1 1 1
# n  2  1 1 0 1
# d  3  1 0 1 0
# e  4  1 1 0 1
# x

# Perms = [1, 2, 3, 4], 
#         [1, 4, 3, 2], 
#         [2, 1, 3, 4], 
#         [2, 4, 3, 1],
#         [3, 2, 1, 4],
#         [3, 4, 1, 2],


# self.ans = 0
# def dfs(i, cands):
#     if i <= 1:
#         self.ans += 1
#         return
#     for j, x in enumerate(cands):
#         if i % x == 0 or x % i == 0:
#             dfs(i-1, cands[:j] + cands[j+1:])
# dfs(n, list(range(1, n+1)))
# return self.ans

#  # @param {Integer} n
# # @return {Integer}
def count_arrangement(n)
  @count = 0

  def arrangement(i, cands)
    if i <= 1
      @count += 1
      return
    end
    cands.each_with_index do |ele, j|
      if beautiful?(ele, i)
        new_cands = cands.reject.with_index{ |_, idx| idx == j }
        arrangement(i-1, new_cands)
      end
    end
  end

  arrangement(n, (1..n).to_a)

  return @count
end

def beautiful?(num, i)
  return (num % i == 0 || i % num == 0)
end

# Example 1:

# Input: 
n = 2
# Output: 2
puts count_arrangement(n)
# Explanation: 
# The first beautiful arrangement is [1, 2]:
# Number at the 1st position (i=1) is 1, and 1 is divisible by i (i=1).
# Number at the 2nd position (i=2) is 2, and 2 is divisible by i (i=2).
# The second beautiful arrangement is [2, 1]:
# Number at the 1st position (i=1) is 2, and 2 is divisible by i (i=1).
# Number at the 2nd position (i=2) is 1, and i (i=2) is divisible by 1.

# Example 2:

# Input: 
n = 1
# Output: 1
puts count_arrangement(n)

 

