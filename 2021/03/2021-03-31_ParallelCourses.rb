# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/592/week-5-march-29th-march-31st/3688/
# Parallel Courses
# You are given an integer n which indicates that we have n courses, labeled from 1 to n. 
# You are also given an array relations where relations[i] = [a, b], representing a prerequisite 
# relationship between course a and course b: course a has to be studied before course b.

# In one semester, you can study any number of courses as long as you have studied all the 
# prerequisites for the course you are studying.

# Return the minimum number of semesters needed to study all courses. If there is no way to 
# study all the courses, return -1.

require_relative '../../DS/ListNode.rb'
# @param {Integer} n
# @param {Integer[][]} relations
# @return {Integer}
def minimum_semesters(n, relations)
  max_path_len = [-Float::INFINITY]
  has_cycle = [false]

  graph = Hash.new { |h,k| h[k] = [] }
  relations.each { |prereq, course| graph[prereq] << course }
  depth = Array.new(n+1)
  color = Array.new(n+1, false)

  (1..n).each { |i| dfs(i, color, depth, graph, has_cycle, max_path_len) }
  return has_cycle[0] ? -1 : max_path_len[0]
end

def dfs(root, color, depth, graph, has_cycle, max_path_len)
  has_cycle[0] = true if color[root]
  return depth[root] if (depth[root] && depth[root] > 0) || has_cycle[0]

  color[root] = true
  max = 0
  if graph[root]
    graph[root].each do |neighbor|
      max = [max, dfs(neighbor, color, depth, graph, has_cycle, max_path_len)].max
    end
  end
  color[root] = false
  depth[root] = max + 1
  max_path_len[0] = [max_path_len[0], depth[root]]
  return depth[root]
end


# Example 1:
# Input: 
n = 3
relations = [[1,3],[2,3]]
# Output: 2
puts minimum_semesters(n, relations)
# Explanation: In the first semester, courses 1 and 2 are studied. In the second semester, 
# course 3 is studied.

# Example 2:
# Input: 
n = 3
relations = [[1,2],[2,3],[3,1]]
# Output: -1
puts minimum_semesters(n, relations)
# Explanation: No course can be studied because they depend on each other.
 

# Constraints:

# 1 <= n <= 5000
# 1 <= relations.length <= 5000
# 1 <= a, b <= n
# a != b
# All the pairs [a, b] are unique.