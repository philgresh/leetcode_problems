# https://leetcode.com/explore/challenge/card/april-leetcoding-challenge-2021/593/week-1-april-1st-april-7th/3696/
# Design Circular Queue
# Design your implementation of the circular queue. The circular queue is a linear data 
# structure in which the operations are performed based on FIFO (First In First Out) 
# principle and the last position is connected back to the first position to make a 
# circle. It is also called "Ring Buffer".

# One of the benefits of the circular queue is that we can make use of the spaces in 
# front of the queue. In a normal queue, once the queue becomes full, we cannot insert 
# the next element even if there is a space in front of the queue. But using the 
# circular queue, we can use the space to store new values.

# Implementation the MyCircularQueue class:

# MyCircularQueue(k) Initializes the object with the size of the queue to be k.
# int Front() Gets the front item from the queue. If the queue is empty, return -1.
# int Rear() Gets the last item from the queue. If the queue is empty, return -1.
# boolean enQueue(int value) Inserts an element into the circular queue. Return true if the operation is successful.
# boolean deQueue() Deletes an element from the circular queue. Return true if the operation is successful.
# boolean isEmpty() Checks whether the circular queue is empty or not.
# boolean isFull() Checks whether the circular queue is full or not.

require_relative '../../DS/ListNode.rb'

class MyCircularQueue
  attr_reader :head, :tail

  def initialize(k)
    @size = k
    @head = ListNode.new(nil)
    @tail = nil
    @count = 0
  end

  def en_queue(value)
    return false if @count == @size
    
    new_node = ListNode.new(value)
    if @count == 0
      @head = new_node
      @tail = @head
    else
      @tail.next = new_node
      @tail = new_node
    end
    @count += 1
    return true
  end
  
  
  def de_queue()
    return false if @count == 0
    @head = @head.next
    @count -= 1
    return true
  end
  
  def front()
    return -1 if @count == 0
    return @head.val
  end
  
  def rear()
    return -1 if @count == 0
    return @tail.val
  end
  
  def is_empty()
    return @count == 0
  end

  def is_full()
    return @count == @size
  end
  
end
  
  # Your MyCircularQueue object will be instantiated and called as such:
  # obj = MyCircularQueue.new(k)
  # param_1 = obj.en_queue(value)
  # param_2 = obj.de_queue()
  # param_3 = obj.front()
  # param_4 = obj.rear()
  # param_5 = obj.is_empty()
  # param_6 = obj.is_full()

# Example 1:

# Input
# ["MyCircularQueue", "enQueue", "enQueue", "enQueue", "enQueue", "Rear", "isFull", "deQueue", "enQueue", "Rear"]
# [[3], [1], [2], [3], [4], [], [], [], [4], []]
# Output
# [null, true, true, true, false, 3, true, true, true, 4]

# Explanation
# MyCircularQueue myCircularQueue = new MyCircularQueue(3);
# myCircularQueue.enQueue(1); // return True
# myCircularQueue.enQueue(2); // return True
# myCircularQueue.enQueue(3); // return True
# myCircularQueue.enQueue(4); // return False
# myCircularQueue.Rear();     // return 3
# myCircularQueue.isFull();   // return True
# myCircularQueue.deQueue();  // return True
# myCircularQueue.enQueue(4); // return True
# myCircularQueue.Rear();     // return 4
 

# Constraints:

# 1 <= k <= 1000
# 0 <= value <= 1000
# At most 3000 calls will be made to enQueue, deQueue, Front, Rear, isEmpty, and isFull.
 

# Follow up: Could you solve the problem without using the built-in queue? 