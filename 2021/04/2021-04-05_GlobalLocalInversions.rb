# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/593/week-1-april-1st-april-7th/3697/
# Global and Local Inversions
# We have some permutation A of [0, 1, ..., N - 1], where N is the length of A.

# The number of (global) inversions is the number of i < j with 0 <= i < j < N and A[i] > A[j].

# The number of local inversions is the number of i with 0 <= i < N and A[i] > A[i+1].

# Return true if and only if the number of global inversions is equal to the number of local inversions.

# @param {Integer[]} a
# @return {Boolean}
def is_ideal_permutation(a)
  a.each.with_index do |ele, i|
    return false if (ele - i).abs > 1
  end
  return true
end

# Example 1:
# Input: 
a = [1,0,2]
# Output: true
puts is_ideal_permutation(a)
# Explanation: There is 1 global inversion, and 1 local inversion.

# Example 2:
# Input: 
a = [1,2,0]
# Output: false
puts is_ideal_permutation(a)
# Explanation: There are 2 global inversions, and 1 local inversion.
# Note:

# A will be a permutation of [0, 1, ..., A.length - 1].
# A will have length in range [1, 5000].
# The time limit for this problem has been reduced.