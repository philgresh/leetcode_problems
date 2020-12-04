require "byebug"

def dfs(graph, start_index, target, discovered = {}, paths = [])
  return [] if start_index == target
  discovered[start_index] = true
  graph[start_index].each do |neighbor|
    unless discovered[neighbor].nil?
      paths.concat(dfs(graph, neighbor, target, discovered, paths))
    end
  end
  paths
end

# @param {Integer[][]} graph
# @return {Integer[][]}
def all_paths_source_target(graph)
end

# DFS
# Push solution into results array
# Check on BFS from results[-2] node

input = [[1, 2], [3], [3], []]

p dfs(input, 0) #[[0, 1, 3], [0, 2, 3]]

# procedure DFS(G, v) is
#     label v as discovered
#     for all directed edges from v to w that are in G.adjacentEdges(v) do
#         if vertex w is not labeled as discovered then
#             recursively call DFS(G, w)
