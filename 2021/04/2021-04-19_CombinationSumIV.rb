# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/595/week-3-april-15th-april-21st/3713/
# Combination Sum IV
# Given an array of distinct integers nums and a target integer target, return the number of possible combinations that add up to target.

# The answer is guaranteed to fit in a 32-bit integer.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def combination_sum4(nums, target)
  dp = Array.new(target, 0)
  dp[0] = 1

  (0..target).each do |comb_sum|
    nums.each do |num|
      if comb_sum - num >= 0
        dp[comb_sum] += dp[comb_sum-num]
      end
    end
  end
  return dp[target]
end

# Example 1:

# Input: nums = [1,2,3], target = 4
# Output: 7
# Explanation:
# The possible combination ways are:
# (1, 1, 1, 1)
# (1, 1, 2)
# (1, 2, 1)
# (1, 3)
# (2, 1, 1)
# (2, 2)
# (3, 1)
# Note that different sequences are counted as different combinations.
# Example 2:

# Input: nums = [9], target = 3
# Output: 0
 

# Constraints:

# 1 <= nums.length <= 200
# 1 <= nums[i] <= 1000
# All the elements of nums are unique.
# 1 <= target <= 1000
 

# Follow up: What if negative numbers are allowed in the given array? How does it change the problem? What limitation we need to add to the question to allow negative numbers?