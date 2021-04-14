# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/594/week-2-april-8th-april-14th/3707/
# Partition List
# Given the head of a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

# You should preserve the original relative order of the nodes in each of the two partitions.
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
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
  before_head = ListNode.new
  before = ListNode.new
  after_head = ListNode.new
  after = ListNode.new

  while head
    if head.val < x
      before.next = head
      before = before.next
    else
      after.next = head
      after = after.next
    end
    head = head.next
  end
  after.next = nil
  before.next = after_head.next

  return before_head.next
end

# Example 1:


# Input: 
head = ListNode.nodify([1,4,3,2,5,2])
x = 3
puts partition(head, x)
# Output: [1,2,2,4,3,5]

# Example 2:

# Input: 
head = ListNode.nodify([2,1])
x = 2
puts partition(head, x)
# Output: [1,2]
 

# Constraints:

# The number of nodes in the list is in the range [0, 200].
# -100 <= Node.val <= 100
# -200 <= x <= 200
