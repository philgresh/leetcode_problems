# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/591/week-4-march-22nd-march-28th/3682/
# 3Sum With Multiplicity
# Given an integer array arr, and an integer target, return the number of tuples i, j, k such that 
# i < j < k and arr[i] + arr[j] + arr[k] == target.

# As the answer can be very large, return it modulo 10**9 + 7.
MOD = 10**9+7
# @param {Integer[]} arr
# @param {Integer} target
# @return {Integer}

# def three_sum_multi(arr, target)
#   count = 0
#   freqs = Hash.new(0)
#   arr.each.with_index do |ele, i|
#     compl = target - ele
#     count += two_sum(freqs, ele, compl)
#   end
#   return count % MOD
# end

# def two_sum(freqs, ele, target)
#   count = 0
  
#   compl = target - ele
#   if freqs[compl]
#     count += freqs[compl]
#   end
#   freqs[ele] += 1
#   return count
# end

# Example 1:

# Input: 
arr = [1,1,2,2,3,3,4,4,5,5]
target = 8
# Output: 20
puts three_sum_multi(arr, target)
# Explanation: 
# Enumerating by the values (arr[i], arr[j], arr[k]):
# (1, 2, 5) occurs 8 times;
# (1, 3, 4) occurs 8 times;
# (2, 2, 4) occurs 2 times;
# (2, 3, 3) occurs 2 times.
# Example 2:

# Input: 
arr = [1,1,2,2,2,2]
target = 5
# Output: 12
puts three_sum_multi(arr, target)
# Explanation: 
# arr[i] = 1, arr[j] = arr[k] = 2 occurs 12 times:
# We choose one 1 from [1,1] in 2 ways,
# and two 2s from [2,2,2,2] in 6 ways.
 

# Constraints:

# 3 <= arr.length <= 3000
# 0 <= arr[i] <= 100
# 0 <= target <= 300