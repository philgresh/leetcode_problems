# https://leetcode.com/problems/min-cost-climbing-stairs/
# 746. Min Cost Climbing Stairs
# Easy

# On a staircase, the i-th step has some non-negative 
# cost cost[i] assigned (0 indexed).

# Once you pay the cost, you can either climb one or two steps. 
# You need to find minimum cost to reach the top of the floor, 
# and you can either start from the step with index 0, or the step with index 1.


def minCostClimbingStairs(self, cost) -> int:
  n = len(cost)
  dp = cost.copy()
  for i in range(2, n):
    dp[i] = min(dp[i-1], dp[i-2]) + cost[i]

  return min(dp[n-1], dp[n-2])
