# https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/573/week-5-december-29th-december-31st/3586/
# Game of Life

# According to Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."

# The board is made up of an m x n grid of cells, where each cell has an initial state: live (represented by a 1) or dead (represented by a 0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):

#     Any live cell with fewer than two live neighbors dies as if caused by under-population.
#     Any live cell with two or three live neighbors lives on to the next generation.
#     Any live cell with more than three live neighbors dies, as if by over-population.
#     Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

# The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously. Given the current state of the m x n grid board, return the next state.

# Constraints:

#     m == board.length
#     n == board[i].length
#     1 <= m, n <= 25
#     board[i][j] is 0 or 1.

# Follow up:

#     Could you solve it in-place? Remember that the board needs to be updated simultaneously: You cannot update some cells first and then use their updated values to update other cells.
#     In this question, we represent the board using a 2D array. In principle, the board is infinite, which would cause problems when the active area encroaches upon the border of the array (i.e., live cells reach the border). How would you address these problems?

# @param {Integer[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def game_of_life(board)
  new_board = Array.new(board.size) { Array.new(board[0]).fill(0) }
  board.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      new_val = update_cell(i, j, board)
      new_board[i][j] = new_val
    end
  end
  update_board(board)
  board.to_s
end

def update_cell(i, j, board)
  neighbors = neighbor_count(i, j, board)
  old_val = board[i][j]
  new_val = old_val
  if old_val == 1
    case neighbors
    when (0...2)
      new_val = -1
    when (2..3)
      new_val = 1
    else
      new_val = -1
    end
  else
    new_val = 2 if neighbors == 3
  end
  board[i][j] = new_val
end

def neighbor_count(row, col, board)
  min_i = [0, row - 1].max
  min_j = [0, col - 1].max
  max_i = [row + 1, board.size - 1].min
  max_j = [col + 1, board[row].size - 1].min

  count = 0

  (min_i..max_i).each do |i|
    (min_j..max_j).each do |j|
      next if i == row && j == col
      cell = board[i][j]
      count += 1 if cell == 1 || cell == -1
    end
  end
  count
end

def update_board(board)
  board.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      new_val = cell > 0 ? 1 : 0
      board[i][j] = new_val
    end
  end
end

# Example 1:

# Input:
board = [[0, 1, 0], [0, 0, 1], [1, 1, 1], [0, 0, 0]]
# Output: [[0,0,0],[1,0,1],[0,1,1],[0,1,0]]
puts game_of_life(board)

# Example 2:

# Input:
board = [[1, 1], [1, 0]]
# Output: [[1,1],[1,1]]
puts game_of_life(board)
