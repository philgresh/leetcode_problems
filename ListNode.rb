class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def self.nodify(arr)
    head = ListNode.new(arr[0])
    curr = head
    (1...arr.size).each do |i|
      curr.next = ListNode.new(arr[i])
      curr = curr.next
    end
    head
  end

  def print_chain
    curr = self
    vals = []
    until curr.nil?
      vals << self.val
      curr = curr.next
    end
    vals
  end

  def to_s
    next_val = @next.nil? ? nil : @next.val
    "ListNode: @val: #{@val} @next.val: #{next_val}"
  end

  def inspect
    self.to_s
  end
end