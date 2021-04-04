# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/593/week-1-april-1st-april-7th/3693/
# Palindrome Linked List

# Given the head of a singly linked list, return true if it is a palindrome.
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
# @return {Boolean}
def is_palindrome(head)
  stack = []
  curr = head
  while curr
    stack << curr
    curr = curr.next
  end
  curr = head
  while curr
    return false if curr.val != stack.pop.val
    curr = curr.next
  end
  return true
end

# Example 1:
# Input: 
head = ListNode.nodify([1,2,2,1])
# Output: true
puts is_palindrome(head).to_s


# Example 2:
# Input: 
head = ListNode.nodify([1,2])
# Output: false
puts is_palindrome(head).to_s
 

# Constraints:

#     The number of nodes in the list is in the range [1, 105].
#     0 <= Node.val <= 9

 
# Follow up: Could you do it in O(n) time and O(1) space?