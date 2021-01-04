# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/579/week-1-january-1st-january-7th/3592/
# Merge Two Sorted Lists

# Merge two sorted linked lists and return it as a sorted list.
# The list should be made by splicing together the nodes of the first two lists.

# Constraints:

#     The number of nodes in both lists is in the range [0, 50].
#     -100 <= Node.val <= 100
#     Both l1 and l2 are sorted in non-decreasing order.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(l1, l2)
  return l2 if l1.nil?
  return l1 if l2.nil?

  new_head = nil
  new_tail = nil
  head1 = l1
  head2 = l2

  if l1.val < l2.val
    new_head = l1
    head1 = head1.next
  else
    new_head = l2
    head2 = head2.next
  end
  new_tail = new_head

  until head1.nil? && head2.nil?
    if head2.nil? || (!head1.nil? && head1.val < head2.val)
      new_tail.next = head1
      head1 = head1.next
    elsif head1.nil? || (!head2.nil? && head1.val >= head2.val)
      new_tail.next = head2
      head2 = head2.next
    end
    new_tail = new_tail.next
  end

  new_head
end

# Example 1:

# Input:
l1 = [1, 2, 4]
l2 = [1, 3, 4]
# Output: [1,1,2,3,4,4]
puts merge_two_lists(l1, l2)

# Example 2:

# Input:
l1 = []
l2 = []
# Output: []
puts merge_two_lists(l1, l2)

# Example 3:

# Input:
l1 = []
l2 = [0]
# Output: [0]
puts merge_two_lists(l1, l2)
