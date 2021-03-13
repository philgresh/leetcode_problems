# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/589/week-2-march-8th-march-14th/3669/
# Check If a String Contains All Binary Codes of Size K
# Given a binary string s and an integer k.

# Return True if every binary code of length k is a substring of s. Otherwise, return False.

# Constraints:

# 1 <= s.length <= 5 * 10^5
# s consists of 0's and 1's only.
# 1 <= k <= 20

# Strategy
# Create a set of all possible combos of binary codes
# Iterate through chars in s, starting with k-1
#   If s[i-k+1..i] is in binary_set, remove it
#   Return true early if binary_set.empty?
# Return binary_set.empty?

# Time complexity: O(s+2**k)
# Space complexity: O(2**k)

require 'set'
require 'byebug'
# @param {String} s
# @param {Integer} k
# @return {Boolean}
def has_all_codes(s, k)
  binary_set = Set.new((0...2**k).to_a)
  (k-1...s.size).each do |j|
    i = j - k + 1
    binary_set.delete(s[i..j].to_i(2))
    
    return true if binary_set.empty?
  end
  
  return binary_set.empty?
end

# Example 1:

# Input: 
s = "00110110"
k = 2
puts has_all_codes(s, k)
# Output: true
# Explanation: The binary codes of length 2 are "00", "01", "10" and "11". They can be all found as substrings at indicies 0, 1, 3 and 2 respectively.

# Example 2:

# Input: 
s = "00110"
k = 2
puts has_all_codes(s, k)
# Output: true

# Example 3:

# Input: 
s = "0110"
k = 1
puts has_all_codes(s, k)
# Output: true
# Explanation: The binary codes of length 1 are "0" and "1", it is clear that both exist as a substring. 

# Example 4:

# Input: 
s = "0110"
k = 2
puts has_all_codes(s, k)
# Output: false
# Explanation: The binary code "00" is of length 2 and doesn't exist in the array.

# Example 5:

# Input: 
s = "0000000001011100"
k = 4
puts has_all_codes(s, k)
# Output: false
 

