# https://leetcode.com/explore/challenge/card/february-leetcoding-challenge-2021/587/week-4-february-22nd-february-28th/3655/
# Maximum Frequency Stack

# Implement FreqStack, a class which simulates the operation of a stack-like data structure.

# FreqStack has two functions:

#     push(int x), which pushes an integer x onto the stack.
#     pop(), which removes and returns the most frequent element in the stack.
#         If there is a tie for most frequent element, the element closest to the top of the stack is removed and returned.

class FreqStack
  def initialize()
    @freq = Hash.new(0)
    @group = Hash.new { |h,k| h[k] = [] }
    @max_freq = 0
  end


=begin
  :type x: Integer
  :rtype: Void
=end
  def push(x)
    @freq[x] += 1
    f = @freq[x]
    if f > @max_freq
      @max_freq = f
    end
    @group[f] << x
  end


=begin
  :rtype: Integer
=end
  def pop(arg=nil)
    x = @group[@max_freq].pop
    @freq[x] -= 1
    if @group[@max_freq].empty?
      @max_freq -= 1
    end
    return x
  end
end

# Your FreqStack object will be instantiated and called as such:
# obj = FreqStack.new()
# obj.push(x)
# param_2 = obj.pop()

# Example 1:

# Input: 
obj = FreqStack.new()
instructions = ["FreqStack","push","push","push","push","push","push","pop","pop","pop","pop"]
val = [[],[5],[7],[5],[7],[4],[5],[],[],[],[]]
instructions.each.with_index do |instruction, i|
  next if instruction == "FreqStack"
  obj.send(instruction.to_sym, val[i])
end
puts obj.to_s
# Output: [null,null,null,null,null,null,null,5,7,5,4]
# Explanation:
# After making six .push operations, the stack is [5,7,5,7,4,5] from bottom to top.  Then:

# pop() -> returns 5, as 5 is the most frequent.
# The stack becomes [5,7,5,7,4].

# pop() -> returns 7, as 5 and 7 is the most frequent, but 7 is closest to the top.
# The stack becomes [5,7,5,4].

# pop() -> returns 5.
# The stack becomes [5,7,4].

# pop() -> returns 4.
# The stack becomes [5,7].

 

# Note:

#     Calls to FreqStack.push(int x) will be such that 0 <= x <= 10^9.
#     It is guaranteed that FreqStack.pop() won't be called if the stack has zero elements.
#     The total number of FreqStack.push calls will not exceed 10000 in a single test case.
#     The total number of FreqStack.pop calls will not exceed 10000 in a single test case.
#     The total number of FreqStack.push and FreqStack.pop calls will not exceed 150000 across all test cases.
