# https://leetcode.com/problems/maximum-gap/
# 164. Maximum Gap
# Hard

# Given an unsorted array, find the maximum difference between the successive elements in its sorted form.

# Return 0 if the array contains less than 2 elements.
require "byebug"
# @param {Integer[]} nums
# @return {Integer}
def maximum_gap(nums)
  return 0 if nums.size <= 1
  nums = radix_sort(nums)
  get_max_between(nums)
end

def radix_sort(nums)
  max_int_length = get_max_digits(nums)
  (0...max_int_length).each do |i|
    bins = Array.new(10) { Array.new }
    nums.each do |num|
      digit = get_digit_from(num, i)
      bins[digit] << num
    end
    nums = []
    bins.each { |bin| nums.concat(bin) }
  end
  return nums
end

def get_max_digits(nums)
  max_so_far = 0
  nums.each do |num|
    max_so_far = [max_so_far, get_int_length(num)].max
  end
  max_so_far
end

def get_digit_from(num, place)
  (num.abs / 10 ** place) % 10
end

def get_int_length(num)
  counter = 0
  while num > 0
    num /= 10
    counter += 1
  end
  return counter
end

def get_max_between(nums)
  max_so_far = 0
  (1...nums.size).each do |i|
    max_so_far = [max_so_far, nums[i] - nums[i - 1]].max
  end
  return max_so_far
end

# Example 1:

# Input:
nums = [3, 6, 9, 1]
puts maximum_gap(nums)
# Output: 3
# Explanation: The sorted form of the array is [1,3,6,9], either
#              (3,6) or (6,9) has the maximum difference 3.

# Example 2:

# Input:
nums = [10]
puts maximum_gap(nums)
# Output: 0
# Explanation: The array contains less than 2 elements, therefore return 0.

# Example 3:

# Input:
nums = [1, 10000000]
# debugger
puts maximum_gap(nums)
# Output: 0
# Explanation: The array contains less than 2 elements, therefore return 0.

# Note:

#     You may assume all elements in the array are non-negative integers and fit in the 32-bit signed integer range.
#     Try to solve it in linear time/space.
