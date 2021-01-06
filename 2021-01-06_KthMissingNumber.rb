# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/579/week-1-january-1st-january-7th/3594/
# Kth Missing Positive Number

# Given an array arr of positive integers sorted in a strictly increasing order, and an integer k.

# Find the kth positive integer that is missing from this array.

# Constraints:

#     1 <= arr.length <= 1000
#     1 <= arr[i] <= 1000
#     1 <= k <= 1000
#     arr[i] < arr[j] for 1 <= i < j <= arr.length
require "byebug"

# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def find_kth_positive(arr, k)
  count = k
  missing = 1
  i = 0
  while count > 0
    if arr[i] != missing
      missing += 1
      count -= 1
    else
      missing += 1
      i += 1
    end
  end
  return missing-1
end

# Example 1:

# Input:
arr = [2, 3, 4, 7, 11]
k = 5
# Output: 9
puts find_kth_positive(arr, k)
# Explanation: The missing positive integers are [1,5,6,8,9,10,12,13,...]. The 5th missing positive integer is 9.

# Example 2:

# Input:
arr = [1, 2, 3, 4]
k = 2
# Output: 6
puts find_kth_positive(arr, k)

# Explanation: The missing positive integers are [5,6,7,...]. The 2nd missing positive integer is 6.
