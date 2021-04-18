# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/595/week-3-april-15th-april-21st/3712/Remove Nth Node From End of List
# Given the head of a linked list, remove the nth node from the end of the list and return its head.

# Follow up: Could you do this in one pass?
require 'byebug'
require_relative '../../DS/ListNode.rb'
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  dummy = ListNode.new(0)
  dummy.next = head
  tail = dummy
  curr = dummy
  (1..n+1).each do
    curr = curr.next
  end
  while curr
    curr = curr.next
    tail = tail.next
  end
  
  debugger
  tail.next = tail.next.next
  return dummy.next
end

# Example 1:

# Input: 
head = ListNode.nodify([1,2,3,4,5])
n = 2
# Output: [1,2,3,5]
puts remove_nth_from_end(head, n)

# Example 2:
# Input: 
head = ListNode.nodify([1])
n = 1
# Output: []
puts remove_nth_from_end(head, n)

# Example 3:
# Input: 
head = ListNode.nodify([1,2])
n = 1
# Output: [1]
puts remove_nth_from_end(head, n)

 
# Constraints:

# The number of nodes in the list is sz.
# 1 <= sz <= 30
# 0 <= Node.val <= 100
# 1 <= n <= sz