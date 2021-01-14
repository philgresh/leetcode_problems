# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/580/week-2-january-8th-january-14th/3603/
# Minimum Operations to Reduce X to Zero

# You are given an integer array nums and an integer x. In one operation, you can either remove the leftmost or the rightmost element from the array nums and subtract its value from x. Note that this modifies the array for future operations.

# Return the minimum number of operations to reduce x to exactly 0 if it's possible, otherwise, return -1.
require "byebug"
# @param {Integer[]} nums
# @param {Integer} x
# @return {Integer}
def min_operations(nums, x)
  target = nums.sum
  return -1 if target < x
  return nums.size if target == x
  
  target -= x
  s = 0
  res = -Float::INFINITY
  sum = 0

  (0...nums.size).each do |i|
    debugger
    sum += nums[i]
    while (sum > target)
      sum -= nums[s]
      s+=1
    end
    if sum == target
      res = [res, i - s + 1].max
    end
  end

  return -1 if res == -Float::INFINITY
  return nums.size - res
end

# Example 1:

# Input:
nums = [1, 1, 4, 2, 3]
x = 5
# Output: 2
puts min_operations(nums, x)
# Explanation: The optimal solution is to remove the last two elements to reduce x to zero.

# Example 2:

# Input:
nums = [5, 6, 7, 8, 9]
x = 4
# Output: -1
puts min_operations(nums, x)

# Example 3:

# Input:
nums = [3, 2, 20, 1, 1, 3]
x = 10
# Output: 5
puts min_operations(nums, x)
# Explanation: The optimal solution is to remove the last three elements and the first two elements (5 operations in total) to reduce x to zero.

# Example 4:

# Input:
nums = [19, 2, 20]
x = 21
# Output: 2
puts min_operations(nums, x)

# Example 5:

# Input:
nums = [1241, 8769, 9151, 3211, 2314, 8007, 3713, 5835, 2176, 8227, 5251, 9229, 904, 1899, 5513, 7878, 8663, 3804, 2685, 3501, 1204, 9742, 2578, 8849, 1120, 4687, 5902, 9929, 6769, 8171, 5150, 1343, 9619, 3973, 3273, 6427, 47, 8701, 2741, 7402, 1412, 2223, 8152, 805, 6726, 9128, 2794, 7137, 6725, 4279, 7200, 5582, 9583, 7443, 6573, 7221, 1423, 4859, 2608, 3772, 7437, 2581, 975, 3893, 9172, 3, 3113, 2978, 9300, 6029, 4958, 229, 4630, 653, 1421, 5512, 5392, 7287, 8643, 4495, 2640, 8047, 7268, 3878, 6010, 8070, 7560, 8931, 76, 6502, 5952, 4871, 5986, 4935, 3015, 8263, 7497, 8153, 384, 1136]
x = 894887480
# Output: -1?
puts min_operations(nums, x)

# Example 6:

# Input:
nums = [8828, 9581, 49, 9818, 9974, 9869, 9991, 10000, 10000, 10000, 9999, 9993, 9904, 8819, 1231, 6309]
x = 134365
# Output: 16
puts min_operations(nums, x)

# Constraints:

#     1 <= nums.length <= 105
#     1 <= nums[i] <= 104
#     1 <= x <= 109
