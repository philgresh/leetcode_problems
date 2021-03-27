# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/591/week-4-march-22nd-march-28th/3685/
# Word Subsets
# We are given two arrays A and B of words.  Each word is a string of lowercase letters.

# Now, say that word b is a subset of word a if every letter in b occurs in a, including multiplicity.  
# For example, "wrr" is a subset of "warrior", but is not a subset of "world".

# Now say a word a from A is universal if for every b in B, b is a subset of a. 

# Return a list of all universal words in A.  You can return the words in any order.

# Strategy:
# Preprocess words in A:
#   Iterate through A
#     For each word, generate a letter-frequency hash
#     For each letter-frequency, add the word to an array as a value: { e1: ['facebook'] }
#   Return letter_freq hash
# Iterate through words in B
#   Set up a possible_matches Set
#   Generate a new letter-frequency hash for the word
#   Iterate through the hash:
#     For the first letter, add any matching words from letter_freq[letter+freq]
#     For rest: `continue` if all matching words from first letter are not in words at letter_freq[letter+freq]
#     Add the word to the results array
# Return the results array
require 'byebug'
# @param {String[]} a
# @param {String[]} b
# @return {String[]}
def word_subsets(a, b)
  a_letter_freq = gen_letter_freq(a)
  b_letter_freq = gen_letter_freq(b)
  a_letter_freq.keep_if { |k, v| b_letter_freq.key?(k) }
  return a_letter_freq.values.reduce(:&) # Return intersection across all arrays
end

def gen_letter_freq(words)
  letter_freq = Hash.new { |h,k| h[k] = [] }
  words.each do |word|
    hash = letter_frequency(word)
    hash.each do |key, val| 
      while val > 0
        letter_freq[key+val.to_s] << word
        val -= 1
      end
    end
  end
  letter_freq
end

def letter_frequency(word)
  hash = Hash.new(0)
  word.each_char do |char|
    hash[char] += 1
  end
  hash
end

# Example 1:
# Input: 
a= ["amazon","apple","facebook","google","leetcode"]
b= ["e","o"]
# Output: ["facebook","google","leetcode"]
puts word_subsets(a,b).to_s

# Example 2:
# Input: 
a= ["amazon","apple","facebook","google","leetcode"]
b= ["l","e"]
# Output: ["apple","google","leetcode"]
puts word_subsets(a,b).to_s

# Example 3:
# Input: 
a= ["amazon","apple","facebook","google","leetcode"]
b= ["e","oo"]
# Output: ["facebook","google"]
puts word_subsets(a,b).to_s

# Example 4:
# Input: 
a= ["amazon","apple","facebook","google","leetcode"]
b= ["lo","eo"]
# Output: ["google","leetcode"]
puts word_subsets(a,b).to_s

# Example 5:
# Input: 
a= ["amazon","apple","facebook","google","leetcode"]
b= ["ec","oc","ceo"]
# Output: ["facebook","leetcode"]
puts word_subsets(a,b).to_s

 
# Note:

# 1 <= A.length, B.length <= 10000
# 1 <= A[i].length, B[i].length <= 10
# A[i] and B[i] consist only of lowercase letters.
# All words in A[i] are unique: there isn't i != j with A[i] == A[j].