
class MinHeap {
  constructor(array) {
    this.heap = this.buildHeap(array);
	}
	
	isEmpty() {
		return this.heap.length === 0;
	}

  buildHeap(array) {
    let currIdx = Math.floor((array.length - 2) / 2);
    while (currIdx >= 0) {
      this.siftDown(array, currIdx);
      currIdx -= 1;
    }
    return array;
  }

  siftDown(heap = this.heap, currIdx = 0) {
    let leftIdx = this.left(currIdx);
    while (leftIdx < heap.length) {
      let rightIdx = this.right(currIdx);
      if (rightIdx > heap.length - 1) rightIdx = -1;
      let idxToSwap;
      if (rightIdx !== -1 && heap[rightIdx] < heap[leftIdx]) {
        idxToSwap = rightIdx;
      } else idxToSwap = leftIdx;
      if (heap[idxToSwap] < heap[currIdx]) {
        this.swap(currIdx, idxToSwap, heap);
        currIdx = idxToSwap;
        leftIdx = this.left(currIdx);
      } else return;
    }
  }

  siftUp(idx, heap = this.heap) {
    let parentIdx = this.parent(idx);
    while (idx > 0 && heap[idx] < heap[parentIdx]) {
      this.swap(idx, parentIdx, heap);
      idx = parentIdx;
      parentIdx = this.parent(idx);
    }
    return heap;
  }

  peek() {
    if (this.heap.length) return this.heap[0];
  }

  remove(heap = this.heap) {
    this.swap(0, heap.length - 1, heap);
    const valueToRemove = heap.pop();
    this.siftDown(heap);

    return valueToRemove;
  }

  insert(value, heap = this.heap) {
    heap.push(value);
    this.siftUp(heap.length - 1, heap);
  }

  left(idx) {
    return 2 * idx + 1;
  }

  right(idx) {
    return 2 * idx + 2;
  }

  parent(idx) {
    return Math.floor((idx - 1) / 2);
  }

  swap(i, j, heap = this.heap) {
    const temp = heap[j];
    heap[j] = heap[i];
    heap[i] = temp;
  }
}

// Do not edit the line below.
exports.MinHeap = MinHeap;
