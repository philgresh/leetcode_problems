# @param {String} s
# @return {Boolean}
require "byebug"

def is_palindrome(s)
  numbers = ("0".."9").to_a
  alpha = ("a".."z").to_a.concat(numbers)
  s = s.split("").select { |char| alpha.include? char.downcase }
  # debugger
  return true if s.length <= 1

  i = 0
  j = s.length - 1

  while i < j
    if s[i].downcase == s[j].downcase
      i += 1
      j -= 1
    else
      return false
    end
  end
  return true
end

puts is_palindrome("A man, a plan, a canal: Panama") #true
puts is_palindrome("race a car")  # false
puts is_palindrome("0P")  # false
puts is_palindrome("")  # true
