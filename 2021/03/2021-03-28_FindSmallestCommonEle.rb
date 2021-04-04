# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/591/week-4-march-22nd-march-28th/3680/
# Find Smallest Common Element in All Rows
# Given an m x n matrix mat where every row is sorted in strictly increasing order, return the smallest common element in all rows.

# If there is no common element, return -1.

require 'byebug'
# @param {Integer[][]} mat
# @return {Integer}
def smallest_common_element(mat)
  mat[0].each do |num|
    is_all = true
    (1...mat.size).each do |i|
      # debugger
      if binary_search(num, mat[i]) == -1
        is_all = false
        break
      end
    end
    return num if is_all
  end
  return -1
end

def binary_search(n, arr)
  return -1 if arr.size == 0
  mid = arr.size / 2
  
  case n <=> arr[mid]
  when 0
    return mid
  when -1
    return binary_search(n, arr[0...mid])
  when 1
    right = binary_search(n, arr[mid+1..-1])
    return -1 if right == -1
    return mid + right + 1
  end
end 

# Example 1:
# Input: 
mat = [
  [1,2,3,4,5],
  [2,4,5,8,10],
  [3,5,7,9,11],
  [1,3,5,7,9]
]
puts smallest_common_element(mat)
# Output: 5

# Example 2:
# Input: 
mat = [
  [1,2,3],
  [2,3,4],
  [2,3,5]
]
puts smallest_common_element(mat)
# Output: 2
 

# Constraints:

# m == mat.length
# n == mat[i].length
# 1 <= m, n <= 500
# 1 <= mat[i][j] <= 104
# mat[i] is sorted in strictly increasing order.