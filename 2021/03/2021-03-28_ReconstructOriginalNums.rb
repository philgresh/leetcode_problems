# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/591/week-4-march-22nd-march-28th/3687/
# Reconstruct Original Digits from English
# Given a non-empty string containing an out-of-order English representation of digits 0-9, output the digits in ascending order.

# Note:
# Input contains only lowercase English letters.
# Input is guaranteed to be valid and can be transformed to its original digits. That means invalid inputs such as "abc" or "zerone" are not permitted.
# Input length is less than 50,000.

# Strategy:
# Preprocessing: Convert numbers 0-9 to English and add their chars to a letter-frequency hash e.g. { 0 => { z: 1, e : 1, r: 1, o: 1 } }
# Create a letter-frequency hash for the input string
# Iterate through numbers 0-9:
#   If the input's letter-freq has all chars in this number, remove one from the frequency and add the number to the result.
# Return the result in sorted order

# Time complexity: O(s)

NUMS = {
  0 => 'zero',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  9 => 'nine'
}

# @param {String} s
# @return {String}
def original_digits(str)
  nums_freqs = gen_nums_freqs
  s_freq = letter_freq(str)
  result = []
  while s_freq.size > 0
    NUMS.each do |i, i_english|
      num_freq = nums_freqs[i]
      is_good = true
      num_freq.each do |letter, freq|
        is_good = false if s_freq[letter] < freq
      end
      if is_good
        num_freq.each do |letter, freq|
          s_freq[letter] -= freq
          if s_freq[letter] == 0
            s_freq.delete(letter)
          end
        end
        result << i
      end
    end
  end
  return result.sort.join('')
end

def letter_freq(str)
  hash = Hash.new(0)
  str.each_char { |char| hash[char] += 1 }
  return hash
end

def gen_nums_freqs
  hash = Hash.new
  NUMS.each do |key, val|
    hash[key] = letter_freq(val)
  end
  return hash
end

# Example 1:
# Input: 
s="owoztneoer"
puts original_digits(s)
# Output: "012"

# Example 2:
# Input: 
s="fviefuro"
puts original_digits(s)
# Output: "45"

# Example 3:
# Input: 
s = "zerozero"
puts original_digits(s)
# Output: "00"