# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/594/week-2-april-8th-april-14th/3706/
# Flatten Nested List Iterator
# You are given a nested list of integers nestedList. Each element is either an integer or a list whose elements may also be integers or other lists. Implement an iterator to flatten it.

# Implement the NestedIterator class:

# NestedIterator(List<NestedInteger> nestedList) Initializes the iterator with the nested list nestedList.
# int next() Returns the next integer in the nested list.
# boolean hasNext() Returns true if there are still some integers in the nested list and false otherwise.

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
#    def get_list()
#        """
#        Return the nested list that this NestedInteger holds, if it holds a nested list
#        Return nil if this NestedInteger holds a single integer
#        @return {NestedInteger[]}
#        """

class NestedIterator
  # @param {NestedInteger[]} nested_list
  def initialize(nested_list)
    @list = NestedIterator.flatten(nested_list)
    @idx = 0
  end

  def self.flatten(arr)
    return [] if arr.empty?

    results = []
    arr.each do |ele|
      if ele.is_integer()
          results << ele.get_integer()
      else
        results.concat(NestedIterator.flatten(ele.get_list()))
      end
    end
    return results
  end

  # @return {Boolean}
  def has_next
    @idx < @list.size
  end

  # @return {Integer}
  def next
    temp = @list[@idx]
    @idx += 1
    return temp
  end
end

# Your NestedIterator will be called like this:
# i, v = NestedIterator.new(nested_list), []
# while i.has_next()
#    v << i.next
# end

# Example 1:

# Input: 
nested_list = [[1,1],2,[1,1]]
i, v = NestedIterator.new(nested_list), []
while i.has_next()
  v << i.next
end
# Output: [1,1,2,1,1]
puts v.to_s
# Explanation: By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1,1,2,1,1].


# Example 2:

# Input: 
nested_list = [1,[4,[6]]]
i, v = NestedIterator.new(nested_list), []
while i.has_next()
   v << i.next
end
# Output: [1,4,6]
puts v.to_s
# Explanation: By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1,4,6].
 

# Constraints:

# 1 <= nestedList.length <= 500
# The values of the integers in the nested list is in the range [-106, 106].