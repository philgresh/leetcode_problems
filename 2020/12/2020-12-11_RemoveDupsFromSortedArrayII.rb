# https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/570/week-2-december-8th-december-14th/3562/
# Given a sorted array nums, remove the duplicates in-place such that duplicates appeared at most twice and return the new length.

# Set up I, J indexes at 0
# Set up len = nums.length
# Iterate through nums by incrementing i, stopping at len -1
#   If duplicate, increment i and j (allow one dup)
#   While j is a duplicate, move to end and reset j to i + 1
#   Increment i
# Return len

# Edge cases:
#   More than 3 duplicates: [0,0,1,1,1,1,2,3,3]
#

# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  i = 0
  j = 0

  while i < nums.size
    j = i + 1
    if nums[i] != nums[j]
      i += 1
      next
    end

    if nums[i] == nums[j] # Allow one dup
      i += 1
      j += 1
    end

    while nums[i] == nums[j] && i + 1 < nums.size
      nums.delete_at(j)
      j = i + 1
    end
    i += 1
  end

  return nums.size
end

# Example 1:

# Input:
nums = [1, 1, 1, 2, 2, 3]
# Output: 5, nums = [1,1,2,2,3]
puts remove_duplicates(nums)
# Explanation: Your function should return length = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively. It doesn't matter what you leave beyond the returned length.

# Example 2:

# Input:
nums = [0, 0, 1, 1, 1, 1, 2, 3, 3]
# Output: 7, nums = [0,0,1,1,2,3,3]
puts remove_duplicates(nums)
# Explanation: Your function should return length = 7, with the first seven elements of nums being modified to 0, 0, 1, 1, 2, 3 and 3 respectively. It doesn't matter what values are set beyond the returned length.

# Example 3:

# Input:
nums = [1, 1, 1]
# Output: 2, nums = [1, 1]
puts remove_duplicates(nums)

# Constraints:

#     0 <= nums.length <= 3 * 104
#     -104 <= nums[i] <= 104
#     nums is sorted in ascending order.
