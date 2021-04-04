# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/591/week-4-march-22nd-march-28th/3683/
# Advantage Shuffle
# Given two arrays A and B of equal size, the advantage of A with respect to B is the number of indices i for which A[i] > B[i].

# Return any permutation of A that maximizes its advantage with respect to B.



# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer[]}
def advantage_count(_a, _b)
  sorted_a = _a.sort { |x ,y| x <=> y }
  sorted_b = _b.sort { |x ,y| x <=> y }

  assigned = Hash.new { |h,k| h[k] = Array.new }
  remaining = []

  i = 0
  sorted_a.each do |a|
    if a > sorted_b[i]
      assigned[sorted_b[i]] << a
      i += 1
    else
      remaining << a
    end
  end
  result = []
  _b.each do |b|
    if assigned[b].empty?
      result << remaining.pop
    else
      assigned[b].pop
    end
  end
  return result
end


# Example 1:

# Input: 
a= [2,7,11,15] # sorted => [15, 11, 7,  2]
b= [1,10,4,11] # sorted => [ 1, 4, 10, 11]
# Output: [2,11,7,15]
puts advantage_count(a, b)

# Example 2:

# Input: 
a= [12,24,8,32]
b= [13,25,32,11]
# Output: [24,32,8,12]
puts advantage_count(a, b)

# Note:

# 1 <= A.length = B.length <= 10000
# 0 <= A[i] <= 10^9
# 0 <= B[i] <= 10^9