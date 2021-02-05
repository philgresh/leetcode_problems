# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/584/week-1-february-1st-february-7th/3628/
# Longest Harmonious Subsequence

# We define a harmonious array as an array where the difference between its maximum value and its minimum value is exactly 1.

# Given an integer array nums, return the length of its longest harmonious subsequence among all its possible subsequences.

# A subsequence of array is a sequence that can be derived from the array by deleting some or no elements without changing the order of the remaining elements.

# @param {Integer[]} nums
# @return {Integer}
def find_lhs(nums)
  # Iterate through nums
  #   Determine longest subseq if num was definitely included
  #   Keep track of abs dist from num, discard subseq if max-min != 1
  #   Keep track of length and overwrite longest_so_far if longer
  # Return longest_so_far

  # Edge cases: nums.size == 1 => 0
  # Remember to include num in count

  longest_so_far = 0
  counts = Hash.new(0)

  nums.each { |num| counts[num] += 1 }

  counts.each do |k, v|
    plus_one = counts[k + 1] > 0 ? counts[k + 1] + v : 0
    minus_one = counts[k - 1] > 0 ? counts[k - 1] + v : 0
    longest_so_far = [longest_so_far, plus_one, minus_one].max
  end

  # nums.each.with_index do |num, i|
  #   count = 0
  #   min = Float::INFINITY
  #   max = -Float::INFINITY

  #   nums.each.with_index do |ele, j|
  #     # if (num - ele).abs <= 1
  #     #   count += 1
  #     #   min = [min, ele].min
  #     #   max = [max, ele].max
  #     # end

  #   end

  #   if max - min == 1
  #     longest_so_far = [longest_so_far, count].max
  #   end
  # end

  return longest_so_far
end

# Example 1:

# Input:
nums = [1, 3, 2, 2, 5, 2, 3, 7]
# Output: 5
puts find_lhs(nums)
# Explanation: The longest harmonious subsequence is [3,2,2,2,3].

# Example 2:

# Input:
nums = [1, 2, 3, 4]
# Output: 2
puts find_lhs(nums)

# Example 3:

# Input:
nums = [1, 1, 1, 1]
# Output: 0
puts find_lhs(nums)

# Example 4:

# Input:
nums = [1]
# Output: 0
puts find_lhs(nums)

# Example 5:

# Input:
nums = [1, 0, 2, 0, 1, 2, 3, 1, 1, 1, 3, 3, 3, 1, 0, 3, 0, 3, 1, 3, -1, 2, 2, 1, 1, 3, 1]
# Output: 14
puts find_lhs(nums)

# Constraints:

#     1 <= nums.length <= 2 * 10^4
#     -10^9 <= nums[i] <= 10^9
