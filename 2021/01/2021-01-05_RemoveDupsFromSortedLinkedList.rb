# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/579/week-1-january-1st-january-7th/3593/

# Remove Duplicates from Sorted List II

# Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list sorted as well.

# Constraints:

#     The number of nodes in the list is in the range [0, 300].
#     -100 <= Node.val <= 100
#     The list is guaranteed to be sorted in ascending order.
require_relative "./ListNode.rb"
require "byebug"

# Definition for singly-linked list.

# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
  dummy_head = ListNode.new(-105, head)
  node = dummy_head
  while node.next
    if node.next.next && node.next.val == node.next.next.val
      val = node.next.val
      while node.next && node.next.val == val
        node.next = node.next.next
      end
    else
      node = node.next
    end
  end
  return dummy_head.next
end

# Example 1:

# Input:
head = ListNode.nodify([1, 2, 3, 3, 4, 4, 5])
# Output: [1,2,5]
puts delete_duplicates(head)

# Example 2:

# Input:
head = ListNode.nodify([1, 1, 1, 2, 3])
# Output: [2,3]
puts delete_duplicates(head)
