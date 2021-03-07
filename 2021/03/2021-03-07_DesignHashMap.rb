# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/588/week-1-march-1st-march-7th/3663/
# Design HashMap

# Design a HashMap without using any built-in hash table libraries.

# To be specific, your design should include these functions:

#     put(key, value) : Insert a (key, value) pair into the HashMap. If the 
#       value already exists in the HashMap, update the value.
#     get(key): Returns the value to which the specified key is mapped, or -1 
#       if this map contains no mapping for the key.
#     remove(key) : Remove the mapping for the value key if this map contains 
#       the mapping for the key.
require 'byebug'
require "test/unit"
extend Test::Unit::Assertions

class MyHashMap
  attr_reader :size
  def initialize(size=nil)
    @size = size || 1024
    @table = Array.new(@size) { Hash.new }
  end

  # value will always be non-negative.
  # :type key: Integer
  # :type value: Integer
  # :rtype: Void

  def put(key, value)
    hash_val = calc_hash_val(key)
    if value.nil?
      @table[hash_val].delete(key)
    else
      @table[hash_val][key] = value
    end
    return nil
  end

  # Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key
  # :type key: Integer
  # :rtype: Integer
  def get(key)
    hash_val = calc_hash_val(key)
    return get_val(hash_val, key)
  end

  # Removes the mapping of the specified value key if this map contains a mapping for the key
  # :type key: Integer
  # :rtype: Void
  def remove(key)
    hash_val = calc_hash_val(key)
    put(key, nil)
    return nil
  end

  def count_at(hash_val)
    return @table[hash_val].size
  end

  private

  def get_val(hash_val, key)
    return -1 if no_key?(hash_val, key)
    return @table[hash_val][key]
  end

  def no_key?(hash_val, key)
    @table[hash_val].keys.size == 0 || !@table[hash_val].include?(key)
  end

  def calc_hash_val(key)
    ((key + 467) * 997 - 1009) % @size
  end
end
  
  # Your MyHashMap object will be instantiated and called as such:
  # obj = MyHashMap.new()
  # obj.put(key, value)
  # param_2 = obj.get(key)
  # obj.remove(key)

# Example:

hashMap = MyHashMap.new();
puts hashMap.put(1, 1);          
puts hashMap.put(2, 2);         
puts hashMap.get(1);            # returns 1
puts hashMap.get(3);            # returns -1 (not found)
puts hashMap.put(2, 1);         # update the existing value
puts hashMap.get(2);            # returns 1 
puts hashMap.remove(2);         # remove the mapping for 2
puts hashMap.get(2);            # returns -1 (not found) 


# debugger
# hashMap = MyHashMap.new();
# commands = ["remove","put","remove","remove","get","remove","put","get","remove","put","put","put","put","put","put","put","put","put","put","put","remove","put","put","get","put","get","put","put","get","put","remove","remove","put","put","get","remove","put","put","put","get","put","put","remove","put","remove","remove","remove","put","remove","get","put","put","put","put","remove","put","get","put","put","get","put","remove","get","get","remove","put","put","put","put","put","put","get","get","remove","put","put","put","put","get","remove","put","put","put","put","put","put","put","put","put","put","remove","remove","get","remove","put","put","remove","get","put","put"]
# args = [[27],[65,65],[19],[0],[18],[3],[42,0],[19],[42],[17,90],[31,76],[48,71],[5,50],[7,68],[73,74],[85,18],[74,95],[84,82],[59,29],[71,71],[42],[51,40],[33,76],[17],[89,95],[95],[30,31],[37,99],[51],[95,35],[65],[81],[61,46],[50,33],[59],[5],[75,89],[80,17],[35,94],[80],[19,68],[13,17],[70],[28,35],[99],[37],[13],[90,83],[41],[50],[29,98],[54,72],[6,8],[51,88],[13],[8,22],[85],[31,22],[60,9],[96],[6,35],[54],[15],[28],[51],[80,69],[58,92],[13,12],[91,56],[83,52],[8,48],[62],[54],[25],[36,4],[67,68],[83,36],[47,58],[82],[36],[30,85],[33,87],[42,18],[68,83],[50,53],[32,78],[48,90],[97,95],[13,8],[15,7],[5],[42],[20],[65],[57,9],[2,41],[6],[33],[16,44],[95,30]]
# expects = [nil,nil,nil,nil,-1,nil,nil,-1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,90,nil,-1,nil,nil,40,nil,nil,nil,nil,nil,29,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,nil,18,nil,nil,-1,nil,nil,-1,35,nil,nil,nil,nil,nil,nil,nil,-1,-1,nil,nil,nil,nil,nil,-1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,-1,nil,nil,nil,nil,87,nil,nil]

# commands.each.with_index do |command, i|
#   result = hashMap.send(command, *args[i])
#   expected = expects[i]
#   assert(result == expected, "Failed #{i}: Expected: #{expected.to_s}, got: #{result}")
# end

# debugger
size = 100000
hash = MyHashMap.new();
(0...size).each do |i|
  hash.put(i, i)
end

string = ""
padding = 0

while size > 0
  size /= 10
  padding += 1
end
string_width = 150 / padding

(0...(hash.size/string_width)).each do |i|
  (0...string_width).each do |j|
    count = hash.count_at(i+j)
    if count > 0
      string << count.to_s.rjust(padding)
    else
      string << " ".rjust(padding)
    end
  end
  string << "|\n"
end
puts string
# Note:

#     All keys and values will be in the range of [0, 1000000].
#     The number of operations will be in the range of [1, 10000].
#     Please do not use the built-in HashMap library.

