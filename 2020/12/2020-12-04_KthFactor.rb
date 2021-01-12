# https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/569/week-1-december-1st-december-7th/3554/

# Analysis: 
#   Time complexity: O(n)
#   Space complexity: O(1)
#   

# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def kth_factor(n, k)
  last_factor = 1
  num_factors = k-1
  i = 2

  while i <= n
    break if num_factors == 0
    if n % i == 0
      last_factor = i
      num_factors -= 1
    end
    i += 1
  end

  return -1 unless num_factors == 0
  return last_factor
end

# Input:
n = 12
k = 3
puts kth_factor(n, k)
# Output: 3
# Explanation: Factors list is [1, 2, 3, 4, 6, 12], the 3rd factor is 3.

# Example 2:

# Input:
n = 7
k = 2
puts kth_factor(n, k)
# Output: 7
# Explanation: Factors list is [1, 7], the 2nd factor is 7.

# Example 3:

# Input:
n = 4
k = 4
puts kth_factor(n, k)
# Output: -1
# Explanation: Factors list is [1, 2, 4], there is only 3 factors. We should return -1.

# Example 4:

# Input:
n = 1
k = 1
puts kth_factor(n, k)
# Output: 1
# Explanation: Factors list is [1], the 1st factor is 1.

# Example 5:

# Input:
n = 1000
k = 3
puts kth_factor(n, k)
# Output: 4
# Explanation: Factors list is [1, 2, 4, 5, 8, 10, 20, 25, 40, 50, 100, 125, 200, 250, 500, 1000].
