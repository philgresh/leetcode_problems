# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/594/week-2-april-8th-april-14th/3702/
# Verifying an Alien Dictionary
# In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. 
# The order of the alphabet is some permutation of lowercase letters.

# Given a sequence of words written in the alien language, and the order of the alphabet, return true if and 
# only if the given words are sorted lexicographicaly in this alien language.
require 'byebug'
# @param {String[]} words
# @param {String} order
# @return {Boolean}
def is_alien_sorted(words, order)
  alpha = alpha_hash(order)
  (1...words.size).each do |i|
    word1 = words[i-1]
    word2 = words[i]

    (0...word1.size).each do |j|
      return false if j == word2.size
      char1, char2 = word1[j], word2[j]
      next if char1 == char2
      return false if alpha[char1] > alpha[char2]
      break
    end
  end
  return true
end

def alpha_hash(order)
  hash = {}
  order.each_char.with_index do |char, i|
    hash[char] = i
  end
  return hash
end

# Example 1:

# Input: 
words = ["hello","leetcode"]
order = "hlabcdefgijkmnopqrstuvwxyz"
# Output: true
puts is_alien_sorted(words, order)
# Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.


# Example 2:

# Input: 
words = ["word","world","row"]
order = "worldabcefghijkmnpqstuvxyz"
# Output: false
puts is_alien_sorted(words, order)
# Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.


# Example 3:

# Input: 
words = ["apple","app"]
order = "abcdefghijklmnopqrstuvwxyz"
# Output: false
puts is_alien_sorted(words, order)
# Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).


 

# Constraints:

# 1 <= words.length <= 100
# 1 <= words[i].length <= 20
# order.length == 26
# All characters in words[i] and order are English lowercase letters.