# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/580/week-2-january-8th-january-14th/3598/
# Word Ladder

# Given two words beginWord and endWord, and a dictionary wordList, return the length of the shortest transformation sequence from beginWord to endWord, such that:

#     Only one letter can be changed at a time.
#     Each transformed word must exist in the word list.

# Return 0 if there is no such transformation sequence.

# Constraints:

#     1 <= beginWord.length <= 100
#     endWord.length == beginWord.length
#     1 <= wordList.length <= 5000
#     wordList[i].length == beginWord.length
#     beginWord, endWord, and wordList[i] consist of lowercase English letters.
#     beginWord != endWord
#     All the strings in wordList are unique.

require "set"
require "byebug"
#  # @param {String} begin_word
# # @param {String} end_word
# # @param {String[]} word_list
# # @return {Integer}
def ladder_length(begin_word, end_word, word_list)
  return 0 if begin_word.nil? || end_word.nil? || word_list.nil? || word_list.size == 0 || !word_list.include?(end_word)
  len = begin_word.size

  all_combos = Hash.new { |h, k| h[k] = [] }
  word_list.each do |word|
    (0...len).each do |i|
      word_seg = word_segment(word, i)
      all_combos[word_seg] << word
    end
  end

  queue = []
  queue.unshift([begin_word, 1])
  visited = Set.new([begin_word])
  until queue.empty?
    curr_word, level = queue.shift()
    (0...len).each do |i|
      # debugger
      intermediate_word = word_segment(curr_word, i)

      all_combos[intermediate_word].each do |word|
        return level + 1 if word == end_word
        if !visited.include?(word)
          visited.add(word)
          queue.push([word, level + 1])
        end
      end
      all_combos[intermediate_word] = []
    end
  end

  return 0
end

def word_segment(word, i)
  word[0...i] + "*" + word[i + 1..-1]
end

# Example 1:

# Input:
begin_word = "hit"
end_word = "cog"
word_list = ["hot", "dot", "dog", "lot", "log", "cog"]
# Output: 5
puts ladder_length(begin_word, end_word, word_list)
# Explanation: As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog", return its length 5.

# Example 2:

# Input:
begin_word = "hit"
end_word = "cog"
word_list = ["hot", "dot", "dog", "lot", "log"]
# Output: 0
puts ladder_length(begin_word, end_word, word_list)
# Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.
