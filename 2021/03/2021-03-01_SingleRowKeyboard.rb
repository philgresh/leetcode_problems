# https://leetcode.com/explore/featured/card/march-leetcoding-challenge-2021/588/week-1-march-1st-march-7th/3656/
# Single-Row Keyboard

# There is a special keyboard with all keys in a single row.

# Given a string keyboard of length 26 indicating the layout of the keyboard 
# (indexed from 0 to 25), initially your finger is at index 0. To type a 
# character, you have to move your finger to the index of the desired character. 
# The time taken to move your finger from index i to index j is |i - j|.

# You want to type a string word. Write a function to calculate how much time 
# it takes to type it with one finger.

# Strategy:
# Preprocess indexes of keyboard keys using a hash
# Set prev-position at 0 and set movements at 0
# Iterate through word
#   Add diff from prev-position to current-position to movements
# Return movements

# Time complexity: O(word) since preprocessing the keyboard is constant
# Space complexity: O(1) since preprocessing the keyboard is constant

# @param {String} keyboard
# @param {String} word
# @return {Integer}
def calculate_time(keyboard, word)
  hash = preprocess_keyboard(keyboard)
  movements = 0
  prev = 0
  word.each_char do |char|
    curr_idx = hash[char]
    movements += (prev - curr_idx).abs
    prev = curr_idx
  end
  return movements
end

def preprocess_keyboard(keyboard)
  hash = Hash.new
  keyboard.each_char.with_index do |char, i|
    hash[char] = i
  end
  return hash
end

# Example 1:

# Input: 
keyboard = "abcdefghijklmnopqrstuvwxyz"
word = "cba"
# Output: 4
puts calculate_time(keyboard, word)
# Explanation: The index moves from 0 to 2 to write 'c' then to 1 to write 'b' then to 0 again to write 'a'.
# Total time = 2 + 1 + 1 = 4. 

# Example 2:

# Input: 
keyboard = "pqrstuvwxyzabcdefghijklmno"
word = "leetcode"
# Output: 73
puts calculate_time(keyboard, word)

 

# Constraints:

#     keyboard.length == 26
#     keyboard contains each English lowercase letter exactly once in some order.
#     1 <= word.length <= 10^4
#     word[i] is an English lowercase letter.

