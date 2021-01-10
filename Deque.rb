# https://medium.com/better-programming/implementing-a-deque-in-ruby-cf6e9bfd9c3c#id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjI1MmZjYjk3ZGY1YjZiNGY2ZDFhODg1ZjFlNjNkYzRhOWNkMjMwYzUiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJuYmYiOjE2MTAzMTA0MTgsImF1ZCI6IjIxNjI5NjAzNTgzNC1rMWs2cWUwNjBzMnRwMmEyamFtNGxqZGNtczAwc3R0Zy5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsInN1YiI6IjExNzM5OTY4NTA3NjkzODA5NTEzMSIsImVtYWlsIjoicGhpbGdyZXNoYW1AZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF6cCI6IjIxNjI5NjAzNTgzNC1rMWs2cWUwNjBzMnRwMmEyamFtNGxqZGNtczAwc3R0Zy5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsIm5hbWUiOiJQaGlsIEdyZXNoYW0iLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EtL0FPaDE0R2kyYmhFLTJkRUpkLXMtOFQxb0NzY082aURfRHlWeFdpd0R2X0FHYmN3PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IlBoaWwiLCJmYW1pbHlfbmFtZSI6IkdyZXNoYW0iLCJpYXQiOjE2MTAzMTA3MTgsImV4cCI6MTYxMDMxNDMxOCwianRpIjoiOWUyMDdlZjRjOGNmY2RkNjQ2MDA0YWU4Mzk1OTQ3YWUyN2I5MDNjYiJ9.gk3pP6Ijv-TQ_YDxuhaRb5t98bK8Pmj6n9MVFM1NGjVC6ok2rkkbTBpJHmIra9Kt6r0p-6Xqj6Ctk7WCibo2n4sJpCTUqwXQu6jzdyfJRhTCwINhqyfXPFrbpk526QUk9ZJcJYoSyDuHgzvIiTe-gmOKx9L8F9Mx_KJFIMzJSptjNR0aCKJPOH7ErrwJe36HPEKsf1uX7CfSUkdSBcgv25z09W7_iU6exnpcziztGgEsfUCOOVNgM6eWPmIy1Uq1LFTBFTeqDpwHfHoD3RgNIw2upg-WlUmkelqD8fugUVdfAdDveEkJvvYwVrmdTgqQx0cwQEhtfD76dt8cT76TVA
class Node
  attr_accessor :value, :next_node, :prev_node

  def initialize(value, next_node = nil, prev_node = nil)
    @value = value
    @next_node = next_node
    @prev_node = prev_node
  end
end

class Deque
  def initialize
    @first = Node.new(nil)
    @last = @first
  end

  def pushFront(val)
    @first = Node.new(val, @first, nil)
    @last = @first if @last and @last.value.nil?
  end

  def pushBack(val)
    self.pushFront(val) && return if @first.value.nil?
    @last.next_node = Node.new(val)
    @last = @last.next_node
  end

  def popFront
    if @last == @first
      @first = Node.new(nil)
      @last = @first
      return
    end
    @first = @first.next_node
  end

  def popBack
    @last = @last.prev_node and return unless @first == @last
    @first = Node.new(nil)
    @last = @first
  end

  def peekFront
    @first.value unless @first.nil?
  end

  def peekBack
    @last.value unless @last.nil?
  end

  def is_empty?
    @first.nil?
  end
end
