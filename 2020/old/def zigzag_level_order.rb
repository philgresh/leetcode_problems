require 'byebug'
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end

    def inspect
      puts "v: #{@val}, l: #{@left}, r: #{@right}"
    end

    def nil?
      @val.nil?
    end
end

def zigzag_level_order(root)
    
end

def build_tree(array)
  nodes = array.map { |ele| TreeNode.new(ele) }
  nodes.each_with_index do |node, i|
    node.left = nodes[2*i+1]
    node.right = nodes[2*i+2]
  end
  nodes.first
end 

root = build_tree([3,9,20,nil,nil,15,7])
puts root
debugger
puts root.left