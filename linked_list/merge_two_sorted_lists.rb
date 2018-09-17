require_relative 'node_module'
# Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

def merge_sorted(head1, head2)
  return nil if head1.nil? && head2.nil?
  dummy = Node.new

  curr, next1, next2 = dummy, head1, head2

  until next1.nil? && next2.nil?
    if next2.nil? || next1 && next1.val <= next2.val
      curr.next = next1
      next1 = next1.next
    end
    if next1.nil? || next2 && next2.val < next1.val
      curr.next = next2
      next2 = next2.next
    end

    curr = curr.next
  end

  dummy.next
end

puts merge_sorted n([1, 2, 4]), n([1, 3, 4]) # 1->1->2->3->4->4
puts merge_sorted l(1, 2, 3, 3, 6), l(2, 4, 4, 5, 7) # 1->1->2->3->4->4

#  1 -> 2 -> 3 -> 3 -> 6
#  C    N1

#  2 -> 4 -> 4 -> 5 -> 7
#  N2


#  1 -> 2 -> 3 -> 3 -> 6
#       C    N1

#  2 -> 4 -> 4 -> 5 -> 7    
#  N2


#  1 -> 2 -> 3 -> 3 -> 6
#     / C    N1
#   /
#  2 -> 4 -> 4 -> 5 -> 7  # C.next = N2
#  N2


#  1 -> 2    3 -> 3 -> 6
#     /      N1
#    / 
#   2 -> 4 -> 4 -> 5 -> 7  # C = N2
#   C    N2

#  1 -> 2   3 -> 3 -> 6
#     /    /C   N1
#    /    /
#   2 ___/  4 -> 4 -> 5 -> 7
#           N2

#  1 -> 2   3 -> 3    6
#     /    /    / C   N1
#    /    /    |
#   2 ___/     4 -> 4 -> 5 -> 7  
#              N2

#  1 -> 2   3 -> 3    6
#     /    /    /     N1
#    /    /    |
#   2 ___/     4 -> 4 -> 5 -> 7  
#                        C   N2

#  1 -> 2   3 -> 3       6 _
#     /    /    /        |  | N1
#    /    /    |         |  |
#   2 ___/     4 -> 4 -> 5  7  
#                           C