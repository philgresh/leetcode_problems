# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/581/week-3-january-15th-january-21st/3606/
# Kth Largest Element in an Array

# Find the kth largest element in an unsorted array.
# Note that it is the kth largest element in the sorted order, not the kth distinct element.
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  n = nums.size
  return select(0, n - 1, n - k, nums)
end

def partition(left, right, pivot_idx, nums)
  pivot = nums[pivot_idx]
  nums[pivot_idx], nums[right] = nums[right], nums[pivot_idx]
  final_idx = left
  (left...right).each do |i|
    if nums[i] < pivot
      nums[final_idx], nums[i] = nums[i], nums[final_idx]
      final_idx += 1
    end
  end
  nums[right], nums[final_idx] = nums[final_idx], nums[right]

  return final_idx
end

def select(left, right, k_smallest, nums)
  return nums[left] if left == right

  pivot_idx = rand(left..right)
  pivot_idx = partition(left, right, pivot_idx, nums)

  if k_smallest == pivot_idx
    return nums[k_smallest]
  elsif k_smallest < pivot_idx
    return select(left, pivot_idx - 1, k_smallest, nums)
  else
    return select(pivot_idx + 1, right, k_smallest, nums)
  end
end

# require_relative '../../DS/MaxHeap.rb'

# # @param {Integer[]} nums
# # @param {Integer} k
# # @return {Integer}
# def find_kth_largest(nums, k)
#   max_heap = MaxHeap.new(nums)
#   i = 0
#   popped = nil
#   while i < k
#     popped = max_heap.pop
#     i+= 1
#   end
#   return popped
# end

# Example 1:

# Input:
nums = [3, 2, 1, 5, 6, 4]
k = 2
# Output: 5
puts find_kth_largest(nums, k)

# Example 2:

# Input:
nums = [3, 2, 3, 1, 2, 4, 5, 5, 6]
k = 4
# Output: 4
puts find_kth_largest(nums, k)

# Note:
# You may assume k is always valid, 1 ≤ k ≤ array's length.
