# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/587/week-4-february-22nd-february-28th/3652/
# Shortest Unsorted Continuous Subarray

# Given an integer array nums, you need to find one continuous subarray that
# if you only sort this subarray in ascending order, then the whole array
# will be sorted in ascending order.

# Return the shortest such subarray and output its length.

# Strategy:
# Move two pointers toward each other, checking to see if there's an inversion
#

# Edge cases:
#   nums.size <= 1 => 0 (sorted)
#   Already sorted => 0 (should iterate through array once)

# @param {Integer[]} nums
# @return {Integer}
def find_unsorted_subarray(nums)
  return 0 if nums.size <= 1
  stack = []
  l = nums.size
  r = 0
  (0...nums.size).each do |i|
    while !stack.empty? && nums[stack.last] > nums[i]
      l = [l, stack.pop].min
    end
    stack.push(i)
  end
  stack = []

  (nums.size - 1).downto(0).each do |i|
    while !stack.empty? && nums[stack.last] < nums[i]
      r = [r, stack.pop].max
    end
    stack.push(i)
  end
  if r - l > 0
    return r - l + 1
  else
    return 0
  end
end

# Example 1:

# Input:
nums = [2, 6, 4, 8, 10, 9, 15]
# Output: 5
puts find_unsorted_subarray(nums)
# Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.

# Example 2:

# Input:
nums = [1, 2, 3, 4]
# Output: 0
puts find_unsorted_subarray(nums)

# Example 3:

# Input:
nums = [1]
# Output: 0
puts find_unsorted_subarray(nums)

# Example 4:

# Input:
nums = [2, 4, 6, 8, 10, 12, 1]
# Output: 7
puts find_unsorted_subarray(nums)

# Constraints:

#     1 <= nums.length <= 104
#     -105 <= nums[i] <= 105

# Follow up: Can you solve it in O(n) time complexity?
