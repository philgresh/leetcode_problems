# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/593/week-1-april-1st-april-7th/3692/
# Largest Unique Number

# Given an array of integers A, return the largest integer that only occurs once.

# If no integer occurs once, return -1.

# Strategy:
# Iterate through A and get frequency of each number
# Set largest to -1
# Iterate through that frequency-hash:
#   If the frequency is 1, set largest to the larger of largest and this num
# Return largest

# Time complexity: O(n)
# Space complexity: O(n)

# @param {Integer[]} a
# @return {Integer}
def largest_unique_number(a)
  freq = Hash.new(0)
  a.each do |num|
    freq[num] += 1
  end
  
  largest = -1
  freq.each do |k, v|
    if v == 1
      largest = [largest, k].max
    end
  end
  return largest
end

# Example 1:
# Input: 
a= [5,7,3,9,4,9,8,3,1]
# Output: 8
puts largest_unique_number(a)
# Explanation: 
# The maximum integer in the array is 9 but it is repeated. The number 8 occurs only once, so it's the answer.

# Example 2:
# Input: 
a= [9,9,8,8]
# Output: -1
puts largest_unique_number(a)
# Explanation: 
# There is no number that occurs only once.

 

# Note:

#     1 <= A.length <= 2000
#     0 <= A[i] <= 1000

