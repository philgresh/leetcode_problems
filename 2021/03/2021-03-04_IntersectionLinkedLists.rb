# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/588/week-1-march-1st-march-7th/3660/

# Intersection of Two Linked Lists

# Write a program to find the node at which the intersection of two singly linked lists begins.

# For example, the following two linked lists:

# begin to intersect at node c1.
require 'byebug'
require_relative '../../DS/ListNode.rb'
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# Strategy:
# Set pointers at heads of each linked list
# Iterate through linked lists until pA == pB
#   When reaching the end, swap the starting position of each
# The pointers should reach the intersect point at the same time
# Return pA or pB

# Edge cases:
#   Do not intersect => will intersect at nil end of list
#   Intersect 100%   => will intersect immediately and while loop will not run

# Time complexity: O(n)
# Space complexity: O(1)

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def getIntersectionNode(headA, headB)
  pA = headA
  pB = headB
  
  while pA != pB
    debugger
    pA = pA.nil? ? headB : pA.next
    pB = pB.nil? ? headA : pB.next
  end
  return pA
end
 

# Example 1:

# Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
# Output: Reference of the node with value = 8
# Input Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,6,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.

 

# Example 2:

# Input: intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
# Output: Reference of the node with value = 2
# Input Explanation: The intersected node's value is 2 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [1,9,1,2,4]. From the head of B, it reads as [3,2,4]. There are 3 nodes before the intersected node in A; There are 1 node before the intersected node in B.

 

# Example 3:

# Input: intersectVal = 0, 
headA = ListNode.nodify([2,6,4])
headB = ListNode.nodify([1,5])
# skipA = 3, skipB = 2
# Output: null
puts getIntersectionNode(headA, headB)
# Input Explanation: From the head of A, it reads as [2,6,4]. From the head of B, it reads as [1,5]. Since the two lists do not intersect, intersectVal must be 0, while skipA and skipB can be arbitrary values.
# Explanation: The two lists do not intersect, so return null.

 

# Notes:

#     If the two linked lists have no intersection at all, return null.
#     The linked lists must retain their original structure after the function returns.
#     You may assume there are no cycles anywhere in the entire linked structure.
#     Each value on each linked list is in the range [1, 10^9].
#     Your code should preferably run in O(n) time and use only O(1) memory.

