# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/580/week-2-january-8th-january-14th/3597/

# Check If Two String Arrays are Equivalent

# Given two string arrays word1 and word2, return true if the two arrays represent the same string, and false otherwise.

# A string is represented by an array if the array elements concatenated in order forms the string.

# Constraints:

#     1 <= word1.length, word2.length <= 103
#     1 <= word1[i].length, word2[i].length <= 103
#     1 <= sum(word1[i].length), sum(word2[i].length) <= 103
#     word1[i] and word2[i] consist of lowercase letters.

# @param {String[]} word1
# @param {String[]} word2
# @return {Boolean}
def array_strings_are_equal(word1, word2)
  str1 = word1.join("")
  str2 = word2.join("")

  return str1 == str2
end

# Example 1:

# Input:
word1 = ["ab", "c"]
word2 = ["a", "bc"]
# Output: true
puts array_strings_are_equal(word1, word2)
# Explanation:
# word1 represents string "ab" + "c" -> "abc"
# word2 represents string "a" + "bc" -> "abc"
# The strings are the same, so return true.

# Example 2:

# Input:
word1 = ["a", "cb"]
word2 = ["ab", "c"]
# Output: false
puts array_strings_are_equal(word1, word2)

# Example 3:

# Input:
word1 = ["abc", "d", "defg"]
word2 = ["abcddefg"]
# Output: true
puts array_strings_are_equal(word1, word2)
