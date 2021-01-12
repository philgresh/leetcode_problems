class GraphNode
  attr_accessor :val, :edges
  def initialize(val, edges)
    @val = val
    @edges = edges || Hash.new
  end

  def add_edge(other, weight, undirected=false)
    self.edges[other] = weight
    other.add_edge(self, weight, true) unless undirected
  end
end

class Graph
  attr_accessor :nodes
  def initialize
    @nodes = []
  end

  def nodify(arr)
    @nodes = arr.map { |val| GraphNode.new(val) }
  end

  def add_node(val, edges=nil)
    @nodes << GraphNode.new(val, edges)
  end

  def dijkstra(node_start, &prc)
    prc ||= { |node| node.edges }
    unvisited = Set.new([])
    dist = []
    prev = []
    queue = []

    @nodes.each.with_index do |node, i|
      if node == node_start
        dist[i] = 0
      else
        dist[i] = Float::INFINITY
      end
      prev[i] = nil
      queue << node
    end
    node_start_idx = @nodes.find_index(node_start)
    distances[node_start_idx] = 0
    
  end


end