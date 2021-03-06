# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/588/week-1-march-1st-march-7th/3662/
# Short Encoding of Words

# A valid encoding of an array of words is any reference string s and array of indices indices such that:

#     words.length == indices.length
#     The reference string s ends with the '#' character.
#     For each index indices[i], the substring of s starting from indices[i] and up to (but not including) the next '#' character is equal to words[i].

# Given an array of words, return the length of the shortest reference string s possible of any valid encoding of words.

class TrieNode 
  def initialize
    @children = Array.new(26)
    count = 0
  end

  def get(char)
    if @children[char - "a"].nil? 
      @children[char-"a"] = TrieNode.new()
      @count += 1
    end
    return children[char - "a"]
  end
end

require 'set'
# @param {String[]} words
# @return {Integer}
def minimum_length_encoding(wrds)
  words = Set.new(wrds)
  nodes = Hash.new { |h,k| h[k] = [] }
  #Trie is a nested dictionary with nodes created
  # when fetched entries are missing
  trie = TrieNode.new

  words.each do |word|
    cur = trie
    word.each_char do |char|
      cur = cur.get(char)
    end
    nodes[cur] << i
  end

  ans = 0
  nodes.keys.each do |node|
    if node.size == 0
  end

int ans = 0;
for (TrieNode node: nodes.keySet()) {
    if (node.count == 0)
        ans += words[nodes.get(node)].length() + 1;
}
blah 
blah 
blah
 string manipulation is lame
 blah
return ans;
end

# Example 1:

# Input: 
words = ["time", "me", "bell"]
# Output: 10
puts minimum_length_encoding(words)
# Explanation: A valid encoding would be s = "time#bell#" and indices = [0, 2, 5].
# words[0] = "time", the substring of s starting from indices[0] = 0 to the next '#' is underlined in "time#bell#"
# words[1] = "me", the substring of s starting from indices[1] = 2 to the next '#' is underlined in "time#bell#"
# words[2] = "bell", the substring of s starting from indices[2] = 5 to the next '#' is underlined in "time#bell#"

# Example 2:

# Input: 
words = ["t"]
# Output: 2
puts minimum_length_encoding(words)
# Explanation: A valid encoding would be s = "t#" and indices = [0].

 
# Constraints:

#     1 <= words.length <= 2000
#     1 <= words[i].length <= 7
#     words[i] consists of only lowercase letters.

