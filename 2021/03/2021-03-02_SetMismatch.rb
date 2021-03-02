# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/588/week-1-march-1st-march-7th/3658/
# Set Mismatch

# You have a set of integers s, which originally contains all the numbers 
# from 1 to n. Unfortunately, due to some error, one of the numbers in s 
# got duplicated to another number in the set, which results in repetition 
# of one number and loss of another number.

# You are given an integer array nums representing the data status of this 
# set after the error.

# Find the number that occurs twice and the number that is missing and 
# return them in the form of an array.

# Time complexity: O(n)
# Space complexity: O(n)

# @param {Integer[]} nums
# @return {Integer[]}
def find_error_nums(nums)
  new_nums = Array.new(nums.size+1).fill(0)
  dup = -1
  missing = 1
  nums.each { |num| new_nums[num] += 1 }
  
  new_nums.each.with_index do |num, i|
    next if i == 0
    missing = i if num == 0
    dup = i if num == 2
  end
  return [dup, missing]
end

# Example 1:

# Input: 
nums = [1,2,2,4]
# Output: [2,3]
puts find_error_nums(nums).to_s

# Example 2:

# Input: 
nums = [1,1]
# Output: [1,2]
puts find_error_nums(nums).to_s

# Example 3:

# Input: 
nums = [2,2]
# Output: [1,2]
puts find_error_nums(nums).to_s
 

# Example 4:

# Input: 
nums = [3,2,2]
# Output: [2,1]
puts find_error_nums(nums).to_s
 

# Constraints:

#     2 <= nums.length <= 104
#     1 <= nums[i] <= 104

