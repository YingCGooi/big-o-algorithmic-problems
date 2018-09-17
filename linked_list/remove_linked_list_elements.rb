# Remove all elements from a linked list of integers that have value val.
require_relative 'node_module'

def remove_elements(head, val)
  head
end

puts nodify([1, 2, 6, 3, 4, 5, 6])
puts remove_elements(nodify([1, 2, 6, 3, 4, 5, 6]), 6) #  1->2->3->4->5

# Input:  [1]->[2]->[6]->[3]->[4]->[5]->[6], val = 6
#          ^H   
#          ^C
#
# Input:  [1]->[2]->[6]->[3]->[4]->[5]->[6], val = 6
#          ^H   ^C     
#          ^P
#          P = C [2]
#          C = C.next [6]
#
# Input:  [1]->[2]->[6]->[3]->[4]->[5]->[6], val = 6
#          ^H   ^P   ^C     
#               P.next = old_C.next [3]
#               C = old_C.next [3]
#
# Input:  [1]->[2]->[3]->[4]->[5]->[6], val = 6
#          ^H   ^P   ^C     
#                    !=val 

# Input:  [1]->[2]->[3]->[4]->[5]->[6], val = 6
#          ^H        ^P   ^C 
# Input:  [1]->[2]->[3]->[4]->[5]->[6], val = 6
#          ^H             ^P   ^C
# Input:  [1]->[2]->[3]->[4]->[5]->[6], val = 6
#          ^H                  ^P   ^C
#                              P.next = C.next (nil) 
#                              C = C.next (nil)
# Check if first node value is target, traverse until we find a node that has a value != target, 
# then change head pointer to that node