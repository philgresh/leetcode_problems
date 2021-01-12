# require "set"
# require "byebug"

class WordDictionary
  class TrieNode
    attr_accessor :nC, :end_of_word

    def initialize
      @nC = Array.new(26, nil)
      @end_of_word = false
    end
  end

  def initialize()
    @root = TrieNode.new
  end

  def self.val(c)
    c.ord - "a".ord
  end

  def self.put(node, word, d)
    node = TrieNode.new if node == nil
    if d == word.length
      node.end_of_word = true
    else
      val = val(word[d])
      node.nC[val] = WordDictionary.put(node.nC[val], word, d + 1)
    end
    return node
  end

  def add_word(word)
    WordDictionary.put(@root, word, 0)
  end

  def self.get(node, word, d)
    return node.end_of_word if (d == word.length)
    return node.nC.select { |n| n != nil }.any? { |n| WordDictionary.get(n, word, d + 1) } if word[d] == "."
    val = val(word[d])
    return node.nC[val] == nil ? false : WordDictionary.get(node.nC[val], word, d + 1)
  end

  def search(word)
    WordDictionary.get(@root, word, 0)
  end
end

# class TrieNode
#   attr_reader :char
#   attr_accessor :next_nodes

#   def initialize(char, next_node = nil)
#     @char = char
#     @next_nodes = Hash.new
#     self.add(next_node) unless next_node.nil?
#   end

#   def inspect
#     # next_chars = []
#     # @next_nodes.each { |char,node| next_chars << node.char unless node.nil? }
#     ":#{self.char} - #{self.next_nodes.keys}"
#   end

#   def include?(char)
#     @next_nodes.include?(char)
#   end

#   def add(node)
#     @next_nodes[node&.char] = node
#   end

#   def to_s
#     @char
#   end

#   def [](char)
#     @next_nodes[char]
#   end
# end

# class Trie
#   attr_reader :base_node, :nil_node

#   def initialize()
#     @nil_node = TrieNode.new(nil)
#     @base_node = TrieNode.new(nil)
#   end

#   def insert(word)
#     # debugger
#     last_node, chars = find_last_node(word)
#     create_new_nodes(last_node, chars)
#   end

# =begin
#     Returns if the word is in the trie.
#     :type word: String
#     :rtype: Boolean
# =end
#   def search?(word)
#     curr_node = @base_node
#     chars = word.split("")
#     char = chars.first
#     # debugger
#     while curr_node.include?(char)
#       curr_node = curr_node[char]
#       char = chars.shift
#     end
#     chars.empty? && curr_node.include?(@nil_node)
#   end

#   # def starts_with(prefix)
#   # end

#   private

#   def find_last_node(word, start_node = @base_node)
#     curr_node = start_node
#     chars = word.split("")

#     char = chars.shift
#     while curr_node.include?(char)
#       curr_node = curr_node[char]
#       char = chars.shift
#     end
#     [curr_node, chars]
#   end

#   def create_new_nodes(start_node, chars)
#     i = 0
#     curr_node = start_node
#     until i == chars.length
#       char = chars[i]
#       new_node = TrieNode.new(char)
#       # new_node.add(@nil_node)
#       curr_node.add(new_node)
#       curr_node = new_node
#       i += 1
#     end
#     curr_node.add(@nil_node)
#     curr_node
#   end
# end

# # Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert("attack")
# obj.insert("bat")
# obj.insert("addition")
# p obj.search?("addition")
# p obj.search?("add")
# # obj.insert(word)
# # param_2 = obj.search(word)
# # param_3 = obj.starts_with(prefix)
# # SELECT COUNT(type) AS num_types FROM (SELECT type, SUM(cost) FROM posessiosn GROUP BY type)
