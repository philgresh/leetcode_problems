# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/589/week-2-march-8th-march-14th/3671/
# Swapping Nodes in a Linked List
# You are given the head of a linked list, and an integer k.

# Return the head of the linked list after swapping the values of the kth node from the beginning and the kth node from the end (the list is 1-indexed).
# Definition for singly-linked list.
require 'byebug'
require_relative '../../DS/ListNode.rb'
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end

# Strategy:
# Run through list once to determine length
# To find kth node and (n-k)th node, set a count and increment as you iterate through the list
# Also keep track of prev1 and prev2 nodes to reassign their next methods

# Edge cases:
#   kth node or n-kth is head (no prev to reassign)

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def swap_nodes(head, k)  
  front_node = nil
  count = 0
  curr = head
  while curr
    count += 1
    front_node = curr if count == k
    curr = curr.next
  end
  n = count

  end_node = head
  (1..n-k).each { |i| end_node = end_node.next }
  front_node.val, end_node.val = end_node.val, front_node.val
  return head
end

def get_length(head)
  count = 0
  curr = head
  while curr
    count += 1
    curr = curr.next
  end
  return count
end

# Example 1:
# Input: 
head = ListNode.nodify([1,2,3,4,5])
k = 2
# Output: [1,4,3,2,5]
result= swap_nodes(head, k)
debugger
puts result

# Example 2:

# Input: 
head = ListNode.nodify([7,9,6,6,7,8,3,0,9,5])
k = 5
# Output: [7,9,6,6,8,7,3,0,9,5]
result= swap_nodes(head, k)
puts result

# Example 3:

# Input: 
head = ListNode.nodify([1])
k = 1
# Output: [1]
result= swap_nodes(head, k)
puts result

# Example 4:

# Input: 
head = ListNode.nodify([1,2])
k = 1
# Output: [2,1]
result= swap_nodes(head, k)
puts result

# Example 5:

# Input: 
head = ListNode.nodify([1,2,3])
k = 2
# Output: [1,2,3]
result= swap_nodes(head, k)
puts result


# Constraints:

# The number of nodes in the list is n.
# 1 <= k <= n <= 105
# 0 <= Node.val <= 100