# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/591/week-4-march-22nd-march-28th/3681/
# Vowel Spellchecker
# Given a wordlist, we want to implement a spellchecker that converts a query word into a correct word.

# For a given query word, the spell checker handles two categories of spelling mistakes:

# Capitalization: If the query matches a word in the wordlist (case-insensitive), then the query word is returned with 
# the same case as the case in the wordlist.
# Example: wordlist = ["yellow"], query = "YellOw": correct = "yellow"
# Example: wordlist = ["Yellow"], query = "yellow": correct = "Yellow"
# Example: wordlist = ["yellow"], query = "yellow": correct = "yellow"
# Vowel Errors: If after replacing the vowels ('a', 'e', 'i', 'o', 'u') of the query word with any vowel individually, 
# it matches a word in the wordlist (case-insensitive), then the query word is returned with the same case as the match in the wordlist.
# Example: wordlist = ["YellOw"], query = "yollow": correct = "YellOw"
# Example: wordlist = ["YellOw"], query = "yeellow": correct = "" (no match)
# Example: wordlist = ["YellOw"], query = "yllw": correct = "" (no match)
# In addition, the spell checker operates under the following precedence rules:

# When the query exactly matches a word in the wordlist (case-sensitive), you should return the same word back.
# When the query matches a word up to capitlization, you should return the first such match in the wordlist.
# When the query matches a word up to vowel errors, you should return the first such match in the wordlist.
# If the query has no matches in the wordlist, you should return the empty string.
# Given some queries, return a list of words answer, where answer[i] is the correct word for query = queries[i].

require 'byebug'

require 'set'
VOWELS = %w(a e i o u)
# @param {String[]} wordlist
# @param {String[]} queries
# @return {String[]}
def spellchecker(wordlist, queries)
  words = Set.new(wordlist)
  vowel_repl = {}
  wordlist.each do |word| 
    vowel_repl[vowel_replacement(word)] = word
  end

  result = []
  queries.each do |query|
    inserted = false
    if words.include?(query)
      result << query
      inserted = true
    elsif words.include?(query.downcase)
      result << query.downcase
      inserted = true
    else
      variation = vowel_replacement(query)
      if vowel_repl.include?(variation)
        result << vowel_repl[variation]
        inserted = true
        break
      end
      variation = vowel_replacement(query.downcase)
      if vowel_repl.include?(variation)
        result << vowel_repl[variation]
        inserted = true
        break
      end
    end
    result << "" unless inserted
  end
  return result
end

def vowel_replacement(word)
  variation = ""
  word.each_char.with_index do |char, i|
    if VOWELS.include?(char.downcase)
      variation += "*"
    else
      variation += char
    end
  end
  return variation
end

# Example 1:

# Input: 
wordlist = ["KiTe","kite","hare","Hare"]
queries = ["kite","Kite","KiTe","Hare","HARE","Hear","hear","keti","keet","keto"]
# Output: ["kite","KiTe","KiTe","Hare","hare","","","KiTe","","KiTe"]
puts spellchecker(wordlist, queries)

# Note:

# 1 <= wordlist.length <= 5000
# 1 <= queries.length <= 5000
# 1 <= wordlist[i].length <= 7
# 1 <= queries[i].length <= 7
# All strings in wordlist and queries consist only of english letters.