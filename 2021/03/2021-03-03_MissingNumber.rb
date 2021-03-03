# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/588/week-1-march-1st-march-7th/3659/
# Missing Number

# Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

# Follow up: Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?

# Strategy:
# Get sum of nums
# Subtract sum from sum of expected_nums
# Return that value

# Edge cases:
#  Only one number ([0]) => should be covered

# Time complexity: O(n)
# Space complexity: O(1)

# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  n = nums.size 
  expected_sum = (n**2 + n)/ 2
  return expected_sum - nums.sum
end

# Example 1:

# Input: 
nums = [3,0,1]
# Output: 2
puts missing_number(nums)
# Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.

# Example 2:

# Input: 
nums = [0,1]
# Output: 2
puts missing_number(nums)
# Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.

# Example 3:

# Input: 
nums = [9,6,4,2,3,5,7,0,1]
# Output: 8
puts missing_number(nums)
# Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.

# Example 4:

# Input: 
nums = [0]
# Output: 1
puts missing_number(nums)
# Explanation: n = 1 since there is 1 number, so all numbers are in the range [0,1]. 1 is the missing number in the range since it does not appear in nums.

 

# Constraints:

#     n == nums.length
#     1 <= n <= 104
#     0 <= nums[i] <= n
#     All the numbers of nums are unique.

