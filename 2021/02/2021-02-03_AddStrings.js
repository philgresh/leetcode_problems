// https://leetcode.com/problems/add-strings

// 415. Add Strings
// Easy

// Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.

/**
 * @param {string} num1
 * @param {string} num2
 * @return {string}
 */
var addStrings = function(num1, num2) {
  if (num1 === '' || num1 === '0') return num2;
  if (num2 === '' || num2 === '0') return num1;
  
  let result = [];
  let carry = 0;
  let i = num1.length - 1;
  let j = num2.length - 1;
  
  while (i >= 0 || j >= 0){
    let thisSum = carry;
    if (i >= 0) thisSum += Number.parseInt(num1[i]);
    if (j >= 0) thisSum += Number.parseInt(num2[j]);
    carry = 0;
    if (thisSum >= 10){
      carry = 1;
      thisSum -= 10;
    }
    i -= 1;
    j -= 1;
    result.push(thisSum);
  }
  
  if (carry === 1) result.push('1');
  return result.reverse().join('');
};

// Note:

//     The length of both num1 and num2 is < 5100.
//     Both num1 and num2 contains only digits 0-9.
//     Both num1 and num2 does not contain any leading zero.
//     You must not use any built-in BigInteger library or convert the inputs to integer directly.
