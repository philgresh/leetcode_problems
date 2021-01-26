import heapq
​
class Solution:
  def minimumEffortPath(self, heights: list[list[int]]) -> int:
    visited = [[False for col in range(len(heights[0]))] for row in range(len(heights))]
    def acceptable(x, y):
      if x < 0 or y < 0:
        return False
      if x >= len(heights) or y >= len(heights[0]):
        return False
      return not visited[x][y]
    
    def neighbors(x, y):
      directions = [[-1, 0], [1, 0], [0, 1], [0, -1]]
      result = []
      for direction in directions:
        newX = x + direction[0]
        newY = y + direction[1]
        if acceptable(newX, newY):
          result.append([newX, newY])
      return result
​
    def effort(pos1, pos2):
      return abs(heights[pos1[0]][pos1[1]]-heights[pos2[0]][pos2[1]])
    
    heap = [[0, 0, 0]] # effort, x, y
    maxEffort = 0
    while len(heap) > 0:
      newEffort, x, y = heapq.heappop(heap)
      if visited[x][y]:
        continue
      visited[x][y] = True
      maxEffort = max(maxEffort, newEffort)
​
      if x == len(heights)-1 and y == len(heights[0]) - 1:
        return maxEffort
​
      for neighbor in neighbors(x,y):
        heapq.heappush(heap, [effort([x,y], neighbor), neighbor[0], neighbor[1]])