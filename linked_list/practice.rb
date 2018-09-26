# LeetCode 21. Merge Two Sorted Lists

# Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

# Example:

# Input: 1->2->4, 1->3->4
# Output: 1->1->2->3->4->4

# Input: Two ll
# Output: New ll
# Time: O(N)
# Space: O(1)

class Node
  attr_accessor :data, :next
  def initialize(data, nex=nil)
    @data = data
    @next = nex
  end
end

def merge_sorted_lists(head1, head2)
  return nil if head1.nil? && head1.nil?
  return head1 if head2.nil?
  return head2 if head1.nil?

  dummy = Node.new(nil)
  curr = dummy
  next1 = head1
  next2 = head2

  until next1.nil? && next2.nil?
    if !next1.nil? && (next2.nil? || next1.data <= next2.data)
      curr.next = next1
      next1 = next1.next
    elsif next1.nil? || next1.data > next2.data
      curr.next = next2
      next2 = next2.next
    end

    curr = curr.next
  end

  dummy.next
end

node1 = Node.new(1)
node1.next = Node.new(2)
node1.next.next = Node.new(4)

node2 = Node.new(1)
node2.next = Node.new(3)
node2.next.next = Node.new(4)

p merge_sorted_lists(node1, node2)

# create dummy node 
# D  1->2->4
# C  1->3->4

# D  1 -> 2 ->4
# C  N1
#    1 -> 3 ->4
#    N2

# D -> 1 -> 2 ->4
# C    N1
#    1 -> 3 ->4
#    N2

# D -> 1 -> 2 ->4
#      C    N1
#      1 -> 3 ->4
#      N2

# D -> 1    2 ->4
#      C \    N1
#         1 -> 3 ->4
#         N2

# D -> 1    2 ->4
#        \ /      N1
#         1  3 ->4
#         C  N2

# D -> 1    2   4 +INF 
#        \ / \ /C N1
#         1   3    ->4 -> 6 -> 7
#                   N2


