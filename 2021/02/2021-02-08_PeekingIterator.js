/**
 * // This is the Iterator's API interface.
 * // You should not implement it, or speculate about its implementation.
 * function Iterator() {
 *    @ return {number}
 *    this.next = function() { // return the next number of the iterator
 *       ...
 *    };
 *
 *    @return {boolean}
 *    this.hasNext = function() { // return true if it still has numbers
 *       ...
 *    };
 * };
 */

/**
 * @param {Iterator} iterator
 */
var PeekingIterator = function (iterator) {
  this.iter = new Iterator(iterator);
  this.peeked = false;
  this.peekedEle = null;
};

/**
 * @return {number}
 */
PeekingIterator.prototype.peek = function () {
  if (this.peeked) return this.peekedEle;

  if (this.iter.hasNext()) {
    this.peeked = true;
    this.peekedEle = this.iter.next();
  } else {
    this.peeked = false;
    this.peekedEle = null;
  }
  return this.peekedEle;
};

/**
 * @return {number}
 */
PeekingIterator.prototype.next = function () {
  let result = null;
  if (this.peeked) {
    this.peeked = false;
    result = this.peekedEle;
    this.peekedEle = null;
  } else {
    result = this.iter.next();
  }
  return result;
};

/**
 * @return {boolean}
 */
PeekingIterator.prototype.hasNext = function () {
  return this.peeked || this.iter.hasNext();
};

/**
 * Your PeekingIterator object will be instantiated and called as such:
 * var obj = new PeekingIterator(arr)
 * var param_1 = obj.peek()
 * var param_2 = obj.next()
 * var param_3 = obj.hasNext()
 */
