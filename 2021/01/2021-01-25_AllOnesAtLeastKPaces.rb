# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/582/week-4-january-22nd-january-28th/3616/
# Check If All 1's Are at Least Length K Places Away

# Given an array nums of 0s and 1s and an integer k, return True if all 1's are at least k places away from each other, otherwise return False.

# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def k_length_apart(nums, k)
  # Set up i pointer to 0
  # Move i to first 1
  # While i < end
  #   Iterate i, keeping count of zeroes in between 1s
  #     Return false if count < k
  # Return true

  i = 0
  while i < nums.size && nums[i] == 0
    i += 1
  end
  i += 1
  count = 0
  while i < nums.size
    if nums[i] == 0
      count += 1
    else
      return false if count < k
      count = 0
    end
    i += 1
  end
  return true
end

# Example 1:

# Input:
nums = [1, 0, 0, 0, 1, 0, 0, 1]
k = 2
# Output: true
puts k_length_apart(nums, k)
# Explanation: Each of the 1s are at least 2 places away from each other.

# Example 2:

# Input:
nums = [1, 0, 0, 1, 0, 1]
k = 2
# Output: false
puts k_length_apart(nums, k)

# Explanation: The second 1 and third 1 are only one apart from each other.

# Example 3:

# Input:
nums = [1, 1, 1, 1, 1]
k = 0
# Output: true
puts k_length_apart(nums, k)

# Example 4:

# Input:
nums = [0, 1, 0, 1]
k = 1
# Output: true
puts k_length_apart(nums, k)

# Example 5:

# Input:
nums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1]
k = 1
# Output: false
puts k_length_apart(nums, k)

# Example 5:

# Input:
nums = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
k = 14
# Output: true
puts k_length_apart(nums, k)

# Constraints:

#     1 <= nums.length <= 105
#     0 <= k <= nums.length
#     nums[i] is 0 or 1
