# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/586/week-3-february-15th-february-21st/3640/
# Kill Process

# Given n processes, each process has a unique PID (process id) and its PPID
# (parent process id).

# Each process only has one parent process, but may have one or more children
# processes. This is just like a tree structure. Only one process has PPID that
# is 0, which means this process has no parent process. All the PIDs will be
# distinct positive integers.

# We use two list of integers to represent a list of processes, where the first
# list contains PID for each process and the second list contains the
# corresponding PPID.

# Now given the two lists, and a PID representing a process you want to kill,
# return a list of PIDs of processes that will be killed in the end.
# You should assume that when a process is killed, all its children processes
# will be killed. No order is required for the final answer.

# Strategy:
# Iterate through pid input to create hash/array of Nodes
# Iterate through Nodes to attach parents (create a graph)
# Traverse graph (BFS) until we find the process to kill
# Traverse graph from killed process and add each process into a results array to return

# Edge cases:
#   Killed process is top-level => Return all

require "byebug"

class Node
  attr_accessor :val, :parent, :children

  def initialize(val)
    @val = val
    @parent = nil
    @children = []
  end

  def self.assign_child(parent, child)
    parent.children << child
    child.parent = parent
  end
end

# @param {Integer[]} pid
# @param {Integer[]} ppid
# @param {Integer} kill
# @return {Integer[]}
def kill_process(pid, ppid, kill)
  nodes_hash = {}
  pid.each { |process| nodes_hash[process] = Node.new(process) }

  root = nil
  pid.each.with_index do |node_val, i|
    if ppid[i] == 0
      root = nodes_hash[node_val]
    else
      parent = nodes_hash[ppid[i]]
      child = nodes_hash[node_val]
      Node.assign_child(parent, child)
    end
  end

  results = []
  debugger
  kill(root, kill, results)
  return results
end

def kill(root, kill, results)
  if root.val == kill
    results << root.val
    root.children.each do |child|
      kill(child, child.val, results)
    end
  else
    root.children.each do |child|
      kill(child, kill, results)
    end
  end
end

# Example 1:

# Input:
pid = [1, 3, 10, 5]
ppid = [3, 0, 5, 3]
kill = 5
# Output: [5,10]
puts kill_process(pid, ppid, kill)
# Explanation:
#            3
#          /   \
#         1     5
#              /
#             10
# Kill 5 will also kill 10.

# Note:

#     The given kill id is guaranteed to be one of the given PIDs.
#     n >= 1.
