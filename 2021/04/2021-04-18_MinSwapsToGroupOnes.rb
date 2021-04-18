# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/595/week-3-april-15th-april-21st/3708/
# Minimum Swaps to Group All 1's Together
# Given a binary array data, return the minimum number of swaps required to group all 1’s present in the array together in any place in the array.

# @param {Integer[]} data
# @return {Integer}
def min_swaps(data)
  n = data.size
  ones = count_ones(data)
  return 0 if ones <= 1

  x = ones
  count_ones = 0
  max_ones = 0

  (0...x).each { |i| count_ones += 1 if data[i] == 1 }
  max_ones = count_ones

  (1...(n - x + 1)).each do |i|
    count_ones -= 1 if (data[i - 1] == 1)
    count_ones += 1 if (data[i + x - 1] == 1)
    max_ones = count_ones if max_ones < count_ones
  end

  num_zeroes = x - max_ones
  return num_zeroes
end

def count_ones(data)
  count = 0
  data.each { |ele| count += 1 if ele == 1 }
  return count
end


# Example 1:

# Input: 
data = [1,0,1,0,1]
# Output: 1
puts min_swaps(data)
# Explanation: 
# There are 3 ways to group all 1's together:
# [1,1,1,0,0] using 1 swap.
# [0,1,1,1,0] using 2 swaps.
# [0,0,1,1,1] using 1 swap.
# The minimum is 1.


# Example 2:
# Input: 
data = [0,0,0,1,0]
# Output: 0
puts min_swaps(data)
# Explanation: 
# Since there is only one 1 in the array, no swaps needed.


# Example 3:
# Input: 
data = [1,0,1,0,1,0,0,1,1,0,1]
# Output: 3
puts min_swaps(data)
# Explanation: 
# One possible solution that uses 3 swaps is [0,0,0,0,0,1,1,1,1,1,1].


# Example 4:
# Input: 
data = [1,0,1,0,1,0,1,1,1,0,1,0,0,1,1,1,0,0,1,1,1,0,1,0,1,1,0,0,0,1,1,1,1,0,0,1]
# Output: 8
puts min_swaps(data)
 

# Constraints:

# 1 <= data.length <= 105
# data[i] is 0 or 1.
