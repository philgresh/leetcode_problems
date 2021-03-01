# https://leetcode.com/problems/missing-ranges/
# 163. Missing Ranges
# Easy

# You are given an inclusive range [lower, upper] and a sorted unique integer array nums, where all elements are in the inclusive range.

# A number x is considered missing if x is in the range [lower, upper] and x is not in nums.

# Return the smallest sorted list of ranges that cover every missing number exactly. That is, no element of nums is in any of the ranges, and each missing number is in one of the ranges.

# Each range [a,b] in the list should be output as:

#     "a->b" if a != b
#     "a" if a == b
require "byebug"
# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {String[]}
def find_missing_ranges(nums, lower, upper)
  n = nums.size
  return [lower, upper] if n == 0

  return [] if lower == upper

  missing = []
  if nums.first > lower
    missing << [lower, nums.first - 1]
  end

  (1...n).each do |i|
    if nums[i] - nums[i - 1] > 1
      missing << [nums[i - 1] + 1, nums[i] - 1]
    end
  end

  if nums.last < upper
    missing << [nums.last + 1, upper]
  end
  return missing_values(missing)
end

def missing_values(missing)
  return missing.map { |v| v[0] == v[1] ? v[1].to_s : "#{v[0]}->#{v[1]}" }
end

# Example 1:

# Input:
nums = [0, 1, 3, 50, 75]
lower = 0
upper = 99
# Output: ["2","4->49","51->74","76->99"]
puts find_missing_ranges(nums, lower, upper).to_s
# Explanation: The ranges are:
# [2,2] --> "2"
# [4,49] --> "4->49"
# [51,74] --> "51->74"
# [76,99] --> "76->99"

# Example 2:

# Input:
nums = []
lower = 1
upper = 1
# Output: ["1"]
puts find_missing_ranges(nums, lower, upper).to_s
# Explanation: The only missing range is [1,1] which becomes "1".

# Example 3:

# Input:
nums = []
lower = -3
upper = -1
# Output: ["-3->-1"]
puts find_missing_ranges(nums, lower, upper).to_s
# Explanation: The only missing range is [-3,-1] which becomes "-3->-1".

# Example 4:

# Input:
nums = [-1]
lower = -1
upper = -1
# Output: []
puts find_missing_ranges(nums, lower, upper).to_s
# Explanation: There are no missing ranges since there are no missing numbers.

# Example 5:

# Input:
nums = [-1]
lower = -2
upper = -1
# Output: ["-2"]
puts find_missing_ranges(nums, lower, upper).to_s

# Constraints:

#     -109 <= lower <= upper <= 109
#     0 <= nums.length <= 100
#     lower <= nums[i] <= upper
#     All the values of nums are unique.
