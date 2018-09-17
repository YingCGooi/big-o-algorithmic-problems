require_relative 'node_module'
# Reverse a singly linked list.

def reverse_list(head)
  return nil if head.nil?
  return head if head.next.nil?

  dummy = nil
  prev, curr, nex = dummy, head, head.next

  until curr.nil?
    curr.next = prev

    prev = curr
    curr = nex
    nex = nex.next if nex
  end
  
  prev
end

puts reverse_list n([1, 2, 3, 4, 5])

# Input: 1->2->3->4->5->NULL
# Output: 5->4->3->2->1->NULL

# nil    [1] -> [2] -> [3] -> [4] -> [5] -> 
#  P      C      N

# nil <- [1]    [2] -> [3] -> [4] -> [5] -> 
#  P      C      N

# nil <- [1]    [2] -> [3] -> [4] -> [5] -> 
#         P      C      N

# nil <- [1] <- [2]    [3] -> [4] -> [5] -> 
#         P      C      N

# nil <- [1] <- [2]    [3] -> [4] -> [5] -> 
#                P      C      N

# nil <- [1] <- [2] <- [3]    [4] -> [5] -> 
#                P      C      N

# nil <- [1] <- [2] <- [3] <- [4]    [5] -> 
#                       P      C      N

# nil <- [1] <- [2] <- [3] <- [4] <- [5]      
#                              P      C      N

# nil <- [1] <- [2] <- [3] <- [4] <- [5]      # break loop if C is nil
#                                     P     CN      