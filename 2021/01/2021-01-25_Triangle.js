// https://leetcode.com/problems/triangle/submissions/
// 120. Triangle
// Medium

// Given a triangle array, return the minimum path sum from top to bottom.

// For each step, you may move to an adjacent number of the row below.
// More formally, if you are on index i on the current row, you may move
// to either index i or index i + 1 on the next row.

/**
 * @param {number[][]} triangle
 * @return {number}
 */
const minimumTotal = (triangle) => {
  // const dp = setupDP(triangle);
  let row_0 = triangle[0];

  let minSoFar = triangle[0][0];

  for (let i = 1; i < triangle.length; i += 1) {
    let row_1 = [...row_0, Infinity];
    const rowLength = triangle[i].length;
    minSoFar = Infinity;
    for (let j = 0; j < rowLength; j++) {
      const upLeft = j > 0 ? row_0[j - 1] : Infinity;
      const upRight = j < rowLength - 1 ? row_0[j] : Infinity;
      const minFromAbove = Math.min(upLeft, upRight);
      const thisCell = triangle[i][j] + minFromAbove;
      row_1[j] = thisCell;
      minSoFar = Math.min(minSoFar, thisCell);
    }
    row_0 = [...row_1];
  }
  return minSoFar;
};

// Example 1:

// Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
// Output: 11
// Explanation: The triangle looks like:
//    2
//   3 4
//  6 5 7
// 4 1 8 3
// The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).

// Example 2:

// Input: triangle = [[-10]]
// Output: -10

// Constraints:

//     1 <= triangle.length <= 200
//     triangle[0].length == 1
//     triangle[i].length == triangle[i - 1].length + 1
//     -104 <= triangle[i][j] <= 104

// Follow up: Could you do this using only O(n) extra space, where n is the total number of rows in the triangle?
