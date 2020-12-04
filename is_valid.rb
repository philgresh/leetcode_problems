# @param {String} s
# @return {Boolean}
require "byebug"

def is_valid(s) # s = "[]"
  return false if s.nil? || s.length <= 1

  brackets = {
    "(" => ")",
    "{" => "}",
    "[" => "]",
  }

  i = 0
  j = s.length - 1

  while i < j
    debugger
    char_i = s[i] # [
    char_j = s[j] # ]

    while char_j != brackets[char_i] && i < j
      j -= 1 #
      char_j = s[j] #
      return false if j <= i
    end

    substr = s[i + 1...j] # ''
    if substr.length > 0
      return false unless is_valid(substr)
    end
    i = j + 1
    j = s.length - 1
  end
  return true
end

s = "{[]}" # true
puts is_valid(s)
