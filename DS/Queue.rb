class Node
  attr_accessor :val, :next

  def initialize(val, next_node = nil)
    @val = val
    @next = next_node
  end
end
require 'byebug'
class Queue
  attr_reader :size

  def initialize
    @first = Node.new(nil)
    @last = @first
    @size = 0
  end

  def self.queuify(arr)
    qu = Queue.new
    arr.each { |ele| qu.push(ele) }
    return qu
  end

  def push(val)
    if @first.val.nil?
      unshift(val)
      return
    end
    @size += 1
    @last.next = Node.new(val)
    @last = @last.next
  end

  def shift(n = 1)
    shifted = []
    debugger
    return shifted if self.empty?
    while n > 0 && @size > 0
      shifted << peek
      @first = @first.next
      @size -= 1
    end
    shifted
  end

  def pop(n = 1)
    shift(n)
  end

  def peek
    @first.val unless @first.nil?
  end

  def first
    peek
  end

  def empty?
    size == 0
  end

  def size
    @size
  end

  def stringify
    return "" if @first.nil?
    new_string = "#{@first.val}"
    curr = @first.next
    until curr.nil?
      new_string += " -> #{curr.val}"
      curr = curr.next
    end
    return new_string
  end

  def inspect
    stringify
  end

  def to_s
    stringify
  end

  def to_a
    result = []
    return result if @first.nil?
    curr = @first
    until curr.nil? || curr.val.nil?
      result << curr.val
      curr = curr.next
    end
    return result
  end

  private

  def unshift(val)
    new_node = Node.new(val, @first)
    @last = @first if @last and @last.val.nil?
  end
end

qu = Queue.queuify([1, 2, 3, 4])
qu.stringify
