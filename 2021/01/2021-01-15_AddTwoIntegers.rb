# https://leetcode.com/problems/sum-of-two-integers/
# 371. Sum of Two Integers
# Medium

# Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.

# @param {Integer} a
# @param {Integer} b
# @return {Integer}
def get_sum(a, b)
  mask = 0xFFFFFFFF

  while b != 0
    a, b = (a ^ b) & mask, ((a & b) << 1) & mask
  end

  max_int = 0x7FFFFFFF
  if a < max_int
    return a
  else
    return ~(a ^ mask)
  end
end

# def get_sum(a, b)
#   x = a.abs
#   y = b.abs
  
#   return get_sum(b, a) if x < y # a must be > b to calc the correct sign
  
#   sign = a > 0 ? 1 : -1

#   if a * b >= 0
#       while y > 0 do
#           r = x ^ y
#           c = (x & y) << 1
#           x = r
#           y = c
#       end
#   else
#       while y > 0 do
#           r = x ^ y
#           b = ((~x) & y) << 1
#           x = r
#           y = b
#       end
#   end
  
#   x * sign
# end

# Example 1:

# Input:
a = 1
b = 2
# Output: 3
puts get_sum(a, b)

# Example 2:

# Input:
a = -2
b = 3
# Output: 1
puts get_sum(a, b)
