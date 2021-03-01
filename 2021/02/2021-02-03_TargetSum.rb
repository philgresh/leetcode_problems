# https://leetcode.com/problems/target-sum/
# 494. Target Sum
# Medium

# You are given a list of non-negative integers, a1, a2, ..., an, and a target, S. Now you have 2 symbols + and -. For each integer, you should choose one from + and - as its new symbol.

# Find out how many ways to assign symbols to make sum of integers equal to target S.

# Call helper function with nums, target=s
# If nums.size == 1 and target == -num: return 1
# For each num:
#   Define count = 0
#   Subset = nums except num
#   Recursively call helper with subset for each pos/neg variant
#     and target = target - variant (+/- num)
#   Return count

# Edge cases: 
#   nums is empty: return 0
#   
 

# @param {Integer[]} nums
# @param {Integer} s
# @return {Integer}
def find_target_sum_ways(nums, s)
end

# Example 1:

# Input: 
nums [1, 1, 1, 1, 1]
s = 3
# Output: 5
puts find_target_sum_ways(nums, s)
# Explanation: 

# -1+1+1+1+1 = 3
# +1-1+1+1+1 = 3
# +1+1-1+1+1 = 3
# +1+1+1-1+1 = 3
# +1+1+1+1-1 = 3

# Example 2:

# Input: 
nums [1, 1]
s = 0
# Output: 2
puts find_target_sum_ways(nums, s)
# Explanation: 
# -1+1 = 1
# +1-1 = 1

# Constraints:

#     The length of the given array is positive and will not exceed 20.
#     The sum of elements in the given array will not exceed 1000.
#     Your output answer is guaranteed to be fitted in a 32-bit integer.

