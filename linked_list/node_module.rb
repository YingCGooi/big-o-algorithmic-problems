class Node
  attr_accessor :next, :val
  def initialize(val = nil)
    @val = val
  end

  def to_s
    str = ''
    node = self
    while node
      str << "[" + node.val.to_s + "]" + " -> "
      node = node.next
    end
    str
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