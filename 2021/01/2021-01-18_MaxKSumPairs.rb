# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/581/week-3-january-15th-january-21st/3608/
# Max Number of K-Sum Pairs

# You are given an integer array nums and an integer k.

# In one operation, you can pick two numbers from the array whose sum equals k and remove them from the array.

# Return the maximum number of operations you can perform on the array.
require "byebug"
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_operations(nums, k)
  targets = Hash.new(0)
  count = 0
  nums.each_with_index do |num, i|
    compl = k - num
    if targets[compl] && targets[compl] > 0
      targets[compl] -= 1
      count += 1
    else
      targets[num] += 1
    end
  end
  return count
end

def not_already_used?(num, compl, targets)
  !targets[compl].empty?
end

# Example 1:

# Input:
nums = [1, 2, 3, 4]
k = 5
# Output: 2
puts max_operations(nums, k)
# Explanation: Starting with nums = [1,2,3,4]:
# - Remove numbers 1 and 4, then nums = [2,3]
# - Remove numbers 2 and 3, then nums = []
# There are no more pairs that sum up to 5, hence a total of 2 operations.

# Example 2:

# Input:
nums = [3, 1, 3, 4, 3]
k = 6
# Output: 1
puts max_operations(nums, k)
# Explanation: Starting with nums = [3,1,3,4,3]:
# - Remove the first two 3's, then nums = [1,4,3]
# There are no more pairs that sum up to 6, hence a total of 1 operation.

# Example 2:

# Input:
nums = [2, 5, 4, 4, 1, 3, 4, 4, 1, 4, 4, 1, 2, 1, 2, 2, 3, 2, 4, 2]
k = 3
# Output: 4
puts max_operations(nums, k)

# Constraints:

#     1 <= nums.length <= 105
#     1 <= nums[i] <= 109
#     1 <= k <= 109
