class Node
  attr_accessor :val, :next

  def initialize(val, next_node = nil)
    @val = val
    @next = next_node
  end
end

class Queue
  attr_reader :size, :first

  def initialize
    @first = nil
    @last = nil
    @size = 0
  end

  def self.queuify(arr)
    qu = Queue.new
    arr.each { |ele| qu.push(ele) }
    return qu
  end

  def push(val)
    if @first.nil? && @last.nil?
      new_node = Node.new(val)
      @first = new_node
      @last = @first
      @size = 1
      return @first
    end
    @size += 1
    @last.next = Node.new(val)
    @last = @last.next
    return @last
  end

  def shift
    return nil if empty?
    @size -= 1
    temp = @first.val
    if @size == 0
      @first = @last = nil
    else
      @first = @first.next
    end
    return temp
  end

  def peek
    @first.val unless @first.nil?
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

  alias :<< push
end