# https://leetcode.com/explore/challenge/card/january-leetcoding-challenge-2021/579/week-1-january-1st-january-7th/3590/
# # Definition for a binary tree node.    
# #     def __init__(self, x):
# #         self.val = x
# #         self.left = None
# #         self.right = None

#   Find a Corresponding Node of a Binary Tree in a Clone of That Tree

# Given two binary trees original and cloned and given a reference to a node target in the original tree.

# The cloned tree is a copy of the original tree.

# Return a reference to the same node in the cloned tree.

# Note that you are not allowed to change any of the two trees or the target node and the answer must be a reference to a node in the cloned tree.

# Follow up: Solve the problem if repeated values on the tree are allowed.

    
class Solution(object):
    def getTargetCopy(self, original, cloned, target):
        """
        :type original: TreeNode
        :type cloned: TreeNode
        :type target: TreeNode
        :rtype: TreeNode
        """
        if original == target:
          return cloned
        if original is None:
            return None

        left = self.getTargetCopy(original.left, cloned.left, target)
        if left is not None:
            return left
        return self.getTargetCopy(original.right, cloned.right, target)
        