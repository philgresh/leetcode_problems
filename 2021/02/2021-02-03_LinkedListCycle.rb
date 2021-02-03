# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/584/week-1-february-1st-february-7th/3627/
# Linked List Cycle

# Given head, the head of a linked list, determine if the linked list has a cycle in it.

# There is a cycle in a linked list if there is some node in the list that can
# be reached again by continuously following the next pointer. Internally, pos is
#  used to denote the index of the node that tail's next pointer is connected to.
#  Note that pos is not passed as a parameter.

# Return true if there is a cycle in the linked list. Otherwise, return false.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end
require_relative "../../DS/ListNode.rb"

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  return false if head.nil?

  tort = head
  hare = head

  while !hare.nil? && !tort.nil? && !hare.next.nil?
    tort = tort.next
    hare = hare.next.next

    return true if hare == tort
  end
  return false
end

# Example 1:

# Input:
head = ListNode.nodify([3, 2, 0, -4])
pos = 1
# Output: true
puts hasCycle(head)
# Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).

# Example 2:

# Input:
head = ListNode.nodify([1, 2])
pos = 0
# Output: true
puts hasCycle(head)
# Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.

# Example 3:

# Input:
head = ListNode.nodify([1])
pos = -1
# Output: false
puts hasCycle(head)
# Explanation: There is no cycle in the linked list.

# Constraints:

#     The number of the nodes in the list is in the range [0, 104].
#     -105 <= Node.val <= 105
#     pos is -1 or a valid index in the linked-list.

# Follow up: Can you solve it using O(1) (i.e. constant) memory?
