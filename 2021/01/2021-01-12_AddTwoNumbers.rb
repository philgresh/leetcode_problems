# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/580/week-2-january-8th-january-14th/3601/
# Add Two Numbers

# You are given two non-empty linked lists representing two non-negative integers.
# The digits are stored in reverse order, and each of their nodes contains a single digit.
# Add the two numbers and return the sum as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
require "byebug"
require_relative "../../DS/ListNode.rb"
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  return l1 if l2.nil?
  return l2 if l1.nil?

  curr_l1 = l1
  curr_l2 = l2
  new_head = ListNode.new(0)
  curr_node = new_head
  carry = 0

  until curr_l1.nil? && curr_l2.nil?
    # debugger
    sum = carry
    sum += curr_l1.nil? ? 0 : curr_l1.val
    sum += curr_l2.nil? ? 0 : curr_l2.val

    curr_node.next = ListNode.new(sum % 10)

    carry = sum >= 10 ? 1 : 0

    curr_l1 = curr_l1.next unless curr_l1.nil?
    curr_l2 = curr_l2.next unless curr_l2.nil?
    curr_node = curr_node.next
  end
  if carry > 0
    curr_node.next = ListNode.new(carry)
  end

  return new_head.next
end

# Example 1:

# Input:
l1 = ListNode.nodify([2, 4, 3])
l2 = ListNode.nodify([5, 6, 4])
# Output: [7,0,8]
puts add_two_numbers(l1, l2)
# Explanation: 342 + 465 = 807.

# Example 2:

# Input:
l1 = ListNode.nodify([0])
l2 = ListNode.nodify([0])
# Output: [0]
puts add_two_numbers(l1, l2)

# Example 3:

# Input:
l1 = ListNode.nodify([9, 9, 9, 9, 9, 9, 9])
l2 = ListNode.nodify([9, 9, 9, 9])
# Output: [8,9,9,9,0,0,0,1]
puts add_two_numbers(l1, l2)

# Constraints:

#     The number of nodes in each linked list is in the range [1, 100].
#     0 <= Node.val <= 9
#     It is guaranteed that the list represents a number that does not have leading zeros.
