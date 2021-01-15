# https://leetcode.com/problems/add-binary/
# 67. Add Binary
# Easy

# Given two binary strings a and b, return their sum as a binary string.

# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  longer = a.size > b.size ? a : b
  shorter = a.size > b.size ? b : a
  i = 0
  j = 0
  carry = "0" * (longer.size + 1)

  while i < longer.size
    
  end

  if carry > 0 && i < longer.size
    longer = "#{carry}#{longer}"
  end

  return longer
end
 

# Example 1:

# Input: 
a = "11"
b = "1"
# Output: "100"
puts add_binary(a, b)

# Example 2:

# Input: 
a = "1010"
b = "1011"
# Output: "10101"
puts add_binary(a, b)


# Constraints:

#     1 <= a.length, b.length <= 104
#     a and b consist only of '0' or '1' characters.
#     Each string does not contain leading zeros except for the zero itself.

