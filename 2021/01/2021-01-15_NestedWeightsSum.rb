# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-20
# Nested List Weight Sum

# You are given a nested list of integers nestedList. Each element is either an integer or a list whose elements may also be integers or other lists.

# The depth of an integer is the number of lists that it is inside of. For example, the nested list [1,[2,2],[[3],2],1] has each integer's value set to its depth.

# Return the sum of each integer in nestedList multiplied by its depth.

 

# Example 1:

# Input: 
# nestedList = [[1,1],2,[1,1]]
# Output: 10

# Explanation: Four 1's at depth 2, one 2 at depth 1. 1*1 + 1*1 + 2*2 + 1*1 + 1*1 = 10.

# Example 2:

# Input: nestedList = [1,[4,[6]]]
# Output: 27
# Explanation: One 1 at depth 1, one 4 at depth 2, and one 6 at depth 3. 1*1 + 4*2 + 6*3 = 27.

# Example 3:

# Input: nestedList = [0]
# Output: 0

 # This is the interface that allows for creating nested lists.
# You should not implement it, or speculate about its implementation
#
#class NestedInteger
#    def is_integer()
#        """
#        Return true if this NestedInteger holds a single integer, rather than a nested list.
#        @return {Boolean}
#        """
#
#    def get_integer()
#        """
#        Return the single integer that this NestedInteger holds, if it holds a single integer
#        Return nil if this NestedInteger holds a nested list
#        @return {Integer}
#        """
#
#    def set_integer(value)
#        """
#        Set this NestedInteger to hold a single integer equal to value.
#        @return {Void}
#        """
#
#    def add(elem)
#        """
#        Set this NestedInteger to hold a nested list and adds a nested integer elem to it.
#        @return {Void}
#        """
#
#    def get_list()
#        """
#        Return the nested list that this NestedInteger holds, if it holds a nested list
#        Return nil if this NestedInteger holds a single integer
#        @return {NestedInteger[]}
#        """

# @param {NestedInteger[]} nested_list
# @return {Integer}
def depth_sum(nested_list)
  depth_sum_helper(nested_list, 1)
end

def depth_sum_helper(list, level)
  return 0 if list.empty?

  sum = 0
  list.each do |ele|
    if ele.is_integer()
      sum += ele * level
    else
      sum += depth_sum_helper(ele, level+1)
    end
  end
  return sum
end

# Constraints:

#     1 <= nestedList.length <= 50
#     The values of the integers in the nested list is in the range [-100, 100].
#     The maximum depth of any integer is less than or equal to 50.

