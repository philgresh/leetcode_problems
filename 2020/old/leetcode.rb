require 'byebug'

class Node
  attr_accessor :neighbors
  attr_reader :val
  def initialize(val, neighs)
    @val = val
    @neighbors = neighs
  end
end

def exist(board, word)
  if board[0].size == 1
    return board[0][0] == word
  end
  g = build_graph(board)

  g.each do |k,node|
    # debugger
    return true if bfs(node, word)

  end

false
end

def bfs(node, word)
  return nil if node.neighbors.empty?
  new_word = word[1..-1].split('')
  this_letter = new_word.shift
  visited = Hash.new
  visited[node] = true
  queue = [node]

  until queue.empty? || new_word.empty?
    curr_node = queue.shift
    visited[curr_node] = true
    neighs = curr_node.neighbors.select {|ele| ele.val == this_letter && !visited.include?(ele)}
    unless neighs.empty?
      queue.concat neighs
      return true if new_word.empty?
      this_letter = new_word.shift
    end
  end
  false
end

def neighs(board, i, j)
    n = []
    n << [i-1, j] if (i-1) > 0
    n << [i, j+1] if (j+1) < board.length
    n << [i+1, j] if (i+1) < board.length
    n << [i, j-1] if (j-1) > 0
    n
  end

def build_graph(board)

  g = Hash.new
  board.each_with_index do |rows, i|
    rows.each_with_index do |val, j|
      g["#{i}-#{j}"] = Node.new(val, neighs(board, i, j))
    end
  end

  g.each do |k,v|
    
    v.neighbors = v.neighbors.map do |i,j|
      g["#{i}-#{j}"]
    end 
  end
  g
end



board = [
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]

word = "ABCCED"

p exist(board, word)
p exist(board, "SEE")
p exist(board, "ABCB")













/**
 * @param {character[][]} board
 * @param {string} word
 * @return {boolean}
 */
var exist = function(board, word) {
    
    // search for word
    // index of the characted in the word
    // row in board
    // col in board
    
    // backtracking
    const isWord = (wordIndex, row, col) => {
        // if index of character in word is equal to the word length
            // return true
        if (wordIndex === word.length) {
            return true;
        }
        
        // if we our outside of the board
            // return false
        if (row < 0 || col < 0 || row >= board.length || col >= board[row].length) {
            return false;
        }
        
        // if character in word matches the character at the row and col of the board
        if (word[wordIndex] === board[row][col]) {
            
            board[row][col] = '##'
            // Do a dfs in all 4 directions
            const nextWordIndex = wordIndex + 1;
            
            // if (isWord(nextWordIndex, row + 1, col)) return true;
            // if (isWord(nextWordIndex, row - 1, col)) return true;
            // if (isWord(nextWordIndex, row, col + 1)) return true;
            // if (isWord(nextWordIndex, row, col - 1)) return true;
            if (isWord(nextWordIndex, row + 1, col) ||
                isWord(nextWordIndex, row - 1, col) ||
                isWord(nextWordIndex, row, col + 1) ||
                isWord(nextWordIndex, row, col - 1)) {
                return true;
            }
            
            // put cell back
            board[row][col] = word[wordIndex];
        }
        
        // return false if no searches match the entire word
        return false;
    }
    
    
    // iterating through the entire matrix
    // iterate through the rows of the board
    for (let row = 0; row < board.length; row++) {
        // iterate through the cols of each row
        for (let col = 0; col < board[row].length; col++) {
            if (isWord(0, row, col)) {
                return true;
            }
            // if cell matches the word 
                // return true
            // otherwise keep searching
        }
    }
    
    // return false  (we have not found the word we are searching for)
    return false;
};