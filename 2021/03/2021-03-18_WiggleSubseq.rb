# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/590/week-3-march-15th-march-21st/3676/
# Wiggle Subsequence
# Given an integer array nums, return the length of the longest wiggle sequence.

# A wiggle sequence is a sequence where the differences between successive numbers strictly alternate between 
# positive and negative. The first difference (if one exists) may be either positive or negative. A sequence with 
# fewer than two elements is trivially a wiggle sequence.

# For example, [1, 7, 4, 9, 2, 5] is a wiggle sequence because the differences (6, -3, 5, -7, 3) are alternately 
# positive and negative.
# In contrast, [1, 4, 7, 2, 5] and [1, 7, 4, 5, 5] are not wiggle sequences, the first because its first two 
# differences are positive and the second because its last difference is zero.
# A subsequence is obtained by deleting some elements (eventually, also zero) from the original sequence, leaving 
# the remaining elements in their original order.

# Strategy:
# Iterate through nums, starting at index 1
#   Ask: What is the long subsequence we can make ending at this number 
# Return the max of subsequences

# Edge cases:
#   All the same number ? => 1
#   Length <= 2 and distinct => 2

# Time complexity: O(n)
# Space complexity: O(1)

# @param {Integer[]} nums
# @return {Integer}
def wiggle_max_length(nums)
  if nums.size <= 2
    if nums.size == 2
      return 2 if nums[0] != nums[1]
      return 1
    end
    return nums.size
  end

  down = 1
  up = 1

  (1...nums.size).each do |i|
    if nums[i] > nums[i-1]
      up = down + 1
    elsif nums[i] < nums[i-1]
      down = up + 1
    end
  end
  return [down, up].max
end

# Example 1:

# Input: 
nums = [1,7,4,9,2,5]
# Output: 6
puts wiggle_max_length(nums)
# Explanation: The entire sequence is a wiggle sequence.

# Example 2:

# Input: 
nums = [1,17,5,10,13,15,10,5,16,8]
# Output: 7
puts wiggle_max_length(nums)
# Explanation: There are several subsequences that achieve this length. One is [1,17,10,13,10,16,8].

# Example 3:

# Input: 
nums = [1,2,3,4,5,6,7,8,9]
# Output: 2
puts wiggle_max_length(nums)

# Example 4:

# Input: 
nums = [1,1,1]
# Output: 1
puts wiggle_max_length(nums)

 

# Constraints:

# 1 <= nums.length <= 1000
# 0 <= nums[i] <= 1000