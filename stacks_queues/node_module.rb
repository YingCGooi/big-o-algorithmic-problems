class Node
  attr_accessor :val, :next

  def initialize(val, nex=nil)
    @val = val
    @next = nex
  end

  def to_s
    "#{val} -> #{self.next}" if self
  end
end

def nodify(arr)
  dummy = Node.new(nil)
  arr.reduce(dummy) { |node, val| node.next = Node.new(val) }
  dummy.next
end