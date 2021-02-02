// https://leetcode.com/problems/unique-paths-ii/
// 63. Unique Paths II
// Medium

// A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

// The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

// Now consider if some obstacles are added to the grids. How many unique paths would there be?

// An obstacle and space is marked as 1 and 0 respectively in the grid.

/**
 * @param {number[][]} obstacleGrid
 * @return {number}
 */
var uniquePathsWithObstacles = function (obstacleGrid) {
  if (obstacleGrid[0][0] === 1) return 0;

  const m = obstacleGrid.length;
  const n = obstacleGrid[0].length;

  const dp = obstacleGrid.map((row, i) => [...obstacleGrid[i]]);

  dp[0][0] = 1;

  for (let i = 1; i < m; i += 1) {
    if (dp[i][0] === 0 && dp[i - 1][0] === 1) {
      dp[i][0] = 1;
    } else dp[i][0] = 0;
  }
  for (let j = 1; j < n; j += 1) {
    if (dp[0][j] === 0 && dp[0][j - 1] === 1) {
      dp[0][j] = 1;
    } else dp[0][j] = 0;
  }

  for (let i = 1; i < m; i += 1) {
    for (let j = 1; j < n; j += 1) {
      dp[i][j] = obstacleGrid[i][j] === 1 ? 0 : dp[i - 1][j] + dp[i][j - 1];
    }
  }

  return dp[m - 1][n - 1];
};

// Example 1:

// Input:
obstacleGrid = [
  [0, 0, 0],
  [0, 1, 0],
  [0, 0, 0],
];
// Output: 2
console.log(uniquePathsWithObstacles(obstacleGrid));
// Explanation: There is one obstacle in the middle of the 3x3 grid above.
// There are two ways to reach the bottom-right corner:
// 1. Right -> Right -> Down -> Down
// 2. Down -> Down -> Right -> Right

// Example 2:

// Input:
obstacleGrid = [
  [0, 1],
  [0, 0],
];
// Output: 1
console.log(uniquePathsWithObstacles(obstacleGrid));

// Constraints:

//     m == obstacleGrid.length
//     n == obstacleGrid[i].length
//     1 <= m, n <= 100
//     obstacleGrid[i][j] is 0 or 1.
