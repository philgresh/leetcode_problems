# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/582/week-4-january-22nd-january-28th/3615/
# Merge k Sorted Lists
require_relative '../../DS/ListNode.rb'
# You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

# Merge all the linked-lists into one sorted linked-list and return it.

 # Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  result = []

  lists.each do |list|
    result = merge_two_lists(result, list)
  end

  return result
end

def merge_two_lists(result, list)
  return result if list.nil?
  new_result = []

  curr = list
  i = 0
  until curr.nil?
    if i < result.size && result[i] <= curr.val
      new_result << result[i]
      i += 1
    else
      new_result << curr.val
      curr = curr.next
    end
  end

  return new_result + result[i..-1]
end

# Example 1:

# Input: 
lists = [
  ListNode.nodify([1,4,5]),
  ListNode.nodify([1,3,4]),
  ListNode.nodify([2,6])
]
# Output: [1,1,2,3,4,4,5,6]
puts merge_k_lists(lists).to_s
# Explanation: The linked-lists are:
# [
#   1->4->5,
#   1->3->4,
#   2->6
# ]
# merging them into one sorted list:
# 1->1->2->3->4->4->5->6

# Example 2:

# Input: 
lists = []
# Output: []
puts merge_k_lists(lists).to_s

# Example 3:

# Input: 
lists = [ListNode.nodify([])]
# Output: []
puts merge_k_lists(lists).to_s
 

# Constraints:

#     k == lists.length
#     0 <= k <= 10^4
#     0 <= lists[i].length <= 500
#     -10^4 <= lists[i][j] <= 10^4
#     lists[i] is sorted in ascending order.
#     The sum of lists[i].length won't exceed 10^4.

