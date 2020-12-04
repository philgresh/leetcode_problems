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
