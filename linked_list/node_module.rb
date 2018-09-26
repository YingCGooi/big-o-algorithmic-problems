class Node
  attr_accessor :next, :val
  def initialize(val = nil)
    @val = val
  end

  def to_s
    "#{val} -> #{self.next}" if self
  end
end

def nodify(arr)
  nodes = arr.map { |data| Node.new(data) }
  nodes.each_with_index { |node, i| node.next = nodes[i + 1] }
  nodes[0]
end

def n(arr)
  nodify(arr)
end

def l(*arr)
  nodify(arr)
end

puts n([1, 2, 3])