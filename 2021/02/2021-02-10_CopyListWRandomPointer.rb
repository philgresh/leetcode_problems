# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/585/week-2-february-8th-february-14th/3635/
# Copy List with Random Pointer

# A linked list of length n is given such that each node contains an additional
# random pointer, which could point to any node in the list, or nil.

# Construct a deep copy of the list. The deep copy should consist of exactly n
# brand new nodes, where each new node has its value set to the value of its
# corresponding original node. Both the next and random pointer of the new nodes
# should point to new nodes in the copied list such that the pointers in the
# original list and copied list represent the same list state. None of the
# pointers in the new list should point to nodes in the original list.

# For example, if there are two nodes X and Y in the original list, where
# X.random --> Y, then for the corresponding two nodes x and y in the copied
# list, x.random --> y.

# Return the head of the copied linked list.

# The linked list is represented in the input/output as a list of n nodes. Each
# node is represented as a pair of [val, random_index] where:

#     val: an integer representing Node.val
#     random_index: the index of the node (range from 0 to n-1) that the random
#       pointer points to, or nil if it does not point to any node.

# Your code will only be given the head of the original linked list.
require "byebug"
# Definition for Node.
class Node
  attr_accessor :val, :next, :random

  def initialize(val = 0)
    @val = val
    @next = nil
    @random = nil
  end

  def self.nodify(arr)
    val, _ = arr[0]
    head = Node.new(val)
    curr = head
    (1...arr.size).each do |i|
      val, _ = arr[i]
      curr.next = Node.new(val)
      curr = curr.next
    end
    head
  end
end

# @param {Node} node
# @return {Node}
# Definition for Node.
# class Node
#     attr_accessor :val, :next, :random
#     def initialize(val = 0)
#         @val = val
#		  @next = nil
#		  @random = nil
#     end
# end

# @param {Node} node
# @return {Node}
def copyRandomList(head)
  visited = Hash.new(false)
  copy_list_helper(head, visited)
end

def copy_list_helper(head, visited)
  return nil if head.nil?
  if visited.include? head
    return visited[head]
  end
  
  node = Node.new(head.val)
  
  visited[head] = node
  node.next = copy_list_helper(head.next, visited)
  node.random = copy_list_helper(head.random, visited)
  return node
end

# Example 1:

# Input:
head = Node.nodify([[7, nil], [13, 0], [11, 4], [10, 2], [1, 0]])
# Output: [[7,nil],[13,0],[11,4],[10,2],[1,0]]
puts copyRandomList(head)

# Example 2:

# Input: head = [[1,1],[2,1]]
# Output: [[1,1],[2,1]]

# Example 3:

# Input: head = [[3,nil],[3,0],[3,nil]]
# Output: [[3,nil],[3,0],[3,nil]]

# Example 4:

# Input: head = []
# Output: []
# Explanation: The given linked list is empty (nil pointer), so return nil.

# Constraints:

#     0 <= n <= 1000
#     -10000 <= Node.val <= 10000
#     Node.random is nil or is pointing to some node in the linked list.
