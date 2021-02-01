class MinHeap
  attr_accessor :heap

  def initialize(array, &comparator)
    @cmp = comparator || lambda { |a, b| a < b }
    array ||= []
    @heap = build_heap(array)
  end

  def build_heap(array)
    curr_idx = (array.size - 2) / 2
    while curr_idx >= 0
      sift_down(curr_idx, array)
      curr_idx -= 1
    end
    return array
  end

  def sift_down(i = 0, array = @heap)
    curr_idx = i
    left_idx = left(curr_idx)

    while (left_idx < array.size)
      right_idx = right(curr_idx)
      right_idx = nil if (right_idx > array.length - 1)
      if right_idx != nil && @cmp.call(array[right_idx], array[left_idx])
        idx_to_swap = right_idx
      else
        idx_to_swap = left_idx
      end
      if @cmp.call(array[idx_to_swap], array[curr_idx])
        swap(curr_idx, idx_to_swap, array)
        curr_idx = idx_to_swap
        left_idx = left(curr_idx)
      else
        return
      end
    end
  end

  def sift_up(idx)
    parent_idx = parent(idx)
    curr_idx = idx
    while curr_idx > 0 && @cmp.call(@heap[curr_idx], @heap[parent_idx])
      swap(curr_idx, parent_idx)
      curr_idx = parent_idx
      parent_idx = parent(curr_idx)
    end
    return @heap
  end

  def peek
    return @heap[0] unless @heap.empty?
    return nil
  end

  def pop
    remove
  end

  def remove
    swap(0, @heap.size - 1)
    val_to_remove = @heap.pop
    sift_down()
    val_to_remove
  end

  def insert(val)
    @heap.push(val)
    sift_up(@heap.size - 1)
  end

  def swap(i, j, array = @heap)
    array[i], array[j] = array[j], array[i]
  end

  def left(idx)
    2 * idx + 1
  end

  def right(idx)
    2 * idx + 2
  end

  def parent(idx)
    (idx - 1) / 2
  end

  def size
    @heap.size
  end

  def is_empty?
    @heap.empty?
  end
end
