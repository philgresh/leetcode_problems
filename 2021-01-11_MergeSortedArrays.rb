# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/580/week-2-january-8th-january-14th/3600/
# Merge Sorted Array

# Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

# The number of elements initialized in nums1 and nums2 are m and n respectively. You may assume that nums1 has enough space (size that is equal to m + n) to hold additional elements from nums2.

# Constraints:

#     0 <= n, m <= 200
#     1 <= n + m <= 200
#     nums1.length == m + n
#     nums2.length == n
#     -109 <= nums1[i], nums2[i] <= 109
require "byebug"
# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  last = m + n - 1
  i = m - 1
  j = n - 1

  while i >= 0 && j >= 0
    if nums1[i] > nums2[j]
      nums1[last] = nums1[i]
      i -= 1
    else
      nums1[last] = nums2[j]
      j -= 1
    end
    last -= 1
  end

  while j >= 0
    nums1[last] = nums2[j]
    j -= 1
    last -= 1
  end
  return nums1
end

# def merge(nums1, m, nums2, n)
#   move_nums_to_back(nums1, m) if m > 0
#   i = nums1.size - m
#   j = 0
#   zero = 0
#   while zero < nums1.size && j < nums2.size
#     # debugger
#     if m > 0 && i < nums1.size && nums1[i] < nums2[j]
#       nums1[zero] = nums1[i]
#       nums1[i] = 0
#       i += 1
#     else
#       nums1[zero] = nums2[j]
#       j += 1
#     end
#     zero += 1
#   end

#   return nums1
# end

# def move_nums_to_back(nums1, m)
#   i = m - 1
#   j = nums1.size - 1
#   while i >= 0
#     nums1[j], nums1[i] = nums1[i], nums1[j]
#     i -= 1
#     j -= 1
#   end
# end

# Example 1:

# Input:
nums1 = [1, 2, 3, 0, 0, 0]
m = 3
nums2 = [2, 5, 6]
n = 3
# Output: [1,2,2,3,5,6]
puts merge(nums1, m, nums2, n).to_s

# Example 2:

# Input:
nums1 = [1]
m = 1
nums2 = []
n = 0
# Output: [1]
puts merge(nums1, m, nums2, n).to_s

# Example 2:
# Input:
nums1 = [0]
m = 0
nums2 = [1]
n = 1
# Output: [1]
puts merge(nums1, m, nums2, n).to_s

# Example 2:
# Input:
nums1 = [4, 0, 0, 0, 0, 0]
m = 1
nums2 = [1, 2, 3, 5, 6]
n = 5
# Output: [1]
puts merge(nums1, m, nums2, n).to_s
