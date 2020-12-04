function twoNumberSum(array, targetSum) {
  const hash = {};

  for (let i = 0; i < array.length; i++) {
    debugger;
    const complementary = targetSum - array[i];
    // console.log({ i, ele: array[i], complementary, hash });
    if (hash[complementary]) {
      return [complementary, array[i]];
    } else hash[array[i]] = true;
  }
  return [];
}

const array = [3, 5, -4, 8, 11, 1, -1, 6];
const targetSum = 10;

console.log(twoNumberSum(array, targetSum));
