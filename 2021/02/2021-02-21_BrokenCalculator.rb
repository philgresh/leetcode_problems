# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/586/week-3-february-15th-february-21st/3647/
# Broken Calculator

# On a broken calculator that has a number showing on its display, we can perform two operations:

#     Double: Multiply the number on the display by 2, or;
#     Decrement: Subtract 1 from the number on the display.

# Initially, the calculator is displaying the number X.

# Return the minimum number of operations needed to display the number Y.
require "byebug"
# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def broken_calc(x, y)
  count = 0
  while y > x
    if y % 2 != 0
      y += 1
    else
      y /= 2
    end
    count += 1
  end

  return count + x - y
end

# Example 1:

# Input:
x = 2
y = 3
# Output: 2

puts broken_calc(x, y)
# Explanation: Use double operation and then decrement operation {2 -> 4 -> 3}.

# Example 2:
# Input:
x = 5
y = 8
# Output: 2
puts broken_calc(x, y)
# Explanation: Use decrement and then double {5 -> 4 -> 8}.

# Example 3:

# Input:
x = 3
y = 10
# Output: 3
puts broken_calc(x, y)
# Explanation:  Use double, decrement and double {3 -> 6 -> 5 -> 10}.

# Example 4:

# Input:
x = 1024
y = 1
# Output: 1023
puts broken_calc(x, y)
# Explanation: Use decrement operations 1023 times.

# Example 5:

# Input:
x = 1024
y = 1024
# Output: 0
puts broken_calc(x, y)

# Example 6:

# Input:
x = 1
y = 1000000000
# Output: 39
puts broken_calc(x, y)

# Note:

#     1 <= X <= 10^9
#     1 <= Y <= 10^9
