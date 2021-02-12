# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/585/week-2-february-8th-february-14th/3637/
# Number of Steps to Reduce a Number to Zero

# Given a non-negative integer num, return the number of steps to reduce it to zero. If the current number is even, you have to divide it by 2, otherwise, you have to subtract 1 from it.

# @param {Integer} num
# @return {Integer}
# def number_of_steps(num)
#   counter = 0
#   while num > 0
#     if num % 2 == 0
#       num /= 2
#     else
#       num -= 1
#     end
#     counter += 1
#   end
#   return counter
# end

def number_of_steps(num)
  str = num.to_s(2)
  counter = 0
  counter += str.count("1")
  counter += str.size
  return counter - 1
end

# Example 1:

# Input:
num = 14
# Output: 6
puts number_of_steps(num)

# Explanation:
# Step 1) 14 is even; divide by 2 and obtain 7.
# Step 2) 7 is odd; subtract 1 and obtain 6.
# Step 3) 6 is even; divide by 2 and obtain 3.
# Step 4) 3 is odd; subtract 1 and obtain 2.
# Step 5) 2 is even; divide by 2 and obtain 1.
# Step 6) 1 is odd; subtract 1 and obtain 0.

# Example 2:

# Input:
num = 8
# Output: 4
puts number_of_steps(num)

# Explanation:
# Step 1) 8 is even; divide by 2 and obtain 4.
# Step 2) 4 is even; divide by 2 and obtain 2.
# Step 3) 2 is even; divide by 2 and obtain 1.
# Step 4) 1 is odd; subtract 1 and obtain 0.

# Example 3:

# Input:
num = 123
# Output: 12
puts number_of_steps(num)

# Constraints:

#     0 <= num <= 10^6
