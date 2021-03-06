# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/582/week-4-january-22nd-january-28th/3618/

# Concatenation of Consecutive Binary Numbers

# Given an integer n, return the decimal value of the binary string formed by concatenating the binary representations of 1 to n in order, modulo 109 + 7.
require "byebug"
require "test/unit/assertions"
include Test::Unit::Assertions
MOD = (10 ** 9 + 7)

# @param {Integer} n
# @return {Integer}
def concatenated_binary(n)
  prev = 0

  (1..n).each do |x|
    bits = Math.log(x, 2).floor + 1
    prev = (prev << bits) + x
    prev = prev % MOD
  end

  prev
end

# Example 1:

# Input:
n = 1
# Output: 1
expected = 1
actual = concatenated_binary(n)
assert_equal(expected, actual, failure_message = "Expected: #{expected}, got: #{actual}")
# Explanation: "1" in binary corresponds to the decimal value 1.

# Example 2:

# Input:
n = 3
# Output: 27
expected = 27
actual = concatenated_binary(n)
assert_equal(expected, actual, failure_message = "Expected: #{expected}, got: #{actual}") # Explanation: In binary, 1, 2, and 3 corresponds to "1", "10", and "11".
# After concatenating them, we have "11011", which corresponds to the decimal value 27.

# Example 3:

# Input:
n = 12
# Output: 505379714
expected = 505379714
actual = concatenated_binary(n)
assert_equal(expected, actual, failure_message = "Expected: #{expected}, got: #{actual}") # Explanation: The concatenation results in "1101110010111011110001001101010111100".
# The decimal value of that is 118505380540.
# After modulo 10^9 + 7, the result is 505379714.

# Constraints:

#     1 <= n <= 105
