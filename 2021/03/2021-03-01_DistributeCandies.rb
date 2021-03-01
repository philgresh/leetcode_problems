# https://leetcode.com/explore/featured/card/march-leetcoding-challenge-2021/588/week-1-march-1st-march-7th/3657/
# Distribute Candies

# Alice has n candies, where the ith candy is of type candy_type[i]. 
# Alice noticed that she started to gain weight, so she visited a doctor.

# The doctor advised Alice to only eat n / 2 of the candies she has (n is 
# always even). Alice likes her candies very much, and she wants to eat the 
# maximum number of different types of candies while still following the
# doctor's advice.

# Given the integer array candy_type of length n, return the maximum number 
# of different types of candies she can eat if she only eats n / 2 of them.

# Strategy:
# Iterate through candy_type
#   Keep track if we've seen this candy type before with a set
#   If not, add it to the set and subtract one from the allowed count
# Stop if we reach the end or run out of count

# Edge cases:
#   All of one type  => 1 (should proceed as normal)

# Time complexity: O(n)
# Space complexity: O(n) (using Set)

require 'set'
# @param {Integer[]} candy_type
# @return {Integer}
def distribute_candies(candy_type)
  candies = Set.new()
  count = candy_type.size / 2
  i = 0
  while count > 0 && i < candy_type.size
    unless candies.include?(candy_type[i])
      count -= 1
      candies.add(candy_type[i])
    end
    i += 1
  end
  return candies.size
end

# Example 1:

# Input: 
candy_type = [1,1,2,2,3,3]
# Output: 3
puts distribute_candies(candy_type)
# Explanation: Alice can only eat 6 / 2 = 3 candies. Since there are only 3 types, she can eat one of each type.

# Example 2:

# Input: 
candy_type = [1,1,2,3]
# Output: 2
puts distribute_candies(candy_type)
# Explanation: Alice can only eat 4 / 2 = 2 candies. Whether she eats types [1,2], [1,3], or [2,3], she still can only eat 2 different types.

# Example 3:

# Input: 
candy_type = [6,6,6,6]
# Output: 1
puts distribute_candies(candy_type)
# Explanation: Alice can only eat 4 / 2 = 2 candies. Even though she can eat 2 candies, she only has 1 type.
 
# Example 3:

# Input: 
candy_type = [1,1,5,2,3,3,4,3]
# Output: 4
puts distribute_candies(candy_type)
# Explanation: Alice can only eat 4 / 2 = 2 candies. Even though she can eat 2 candies, she only has 1 type.

 

# Constraints:

#     n == candy_type.length
#     2 <= n <= 104
#     n is even.
#     -105 <= candy_type[i] <= 105

