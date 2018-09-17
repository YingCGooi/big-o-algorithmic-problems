# Reverse a linked list from position m to n. Do it in one-pass.
require_relative 'node_module'

def reverse_between(head, start, ending)
  return nil if head.nil?
  return head if head.next.nil?
  index = 1

  dummy = nil
  prev, curr, nex = dummy, head, head.next
  left, right = nil, nil

  until index > ending
    if index == start
      left = prev
      right = curr
      right.next = nil # avoids two nodes pointing to each other
    elsif index.between?(start + 1, ending)
      curr.next = prev
    end

    index += 1
    prev = curr
    curr = nex
    nex = nex.next if nex 
    break if index == 6
  end

  head = prev if left == dummy
  left.next = prev if left
  right.next = curr

  head
end

puts reverse_between n([1, 2, 3, 4, 5]), 2, 4
puts reverse_between n([1, 2, 3, 4, 5]), 1, 3
puts reverse_between n([1, 2]), 1, 2
puts reverse_between n([-5,4,-2,-2,-2,3,-3]), 1, 3
# Input: 1->2->3->4->5->NULL, m = 2, n = 4
# Output: 1->4->3->2->5->NULL

#         I=1
#  nil -> [1] -> [2] -> [3] -> [4] -> [5] -> 
#   P      C      N
          
#          L     I=2 (start reversing)     
#  nil -> [1] -> [2] -> [3] -> [4] -> [5] -> 
#          P      CR     N
           
#          L      R     I=3
#  nil -> [1] -> [2] -> [3] -> [4] -> [5] -> 
#                 P      C      N

#          L      R     I=3
#  nil -> [1] -> [2] <- [3]    [4] -> [5] -> 
#                 P      C      N

#          L      R     I=3
#  nil -> [1] -> [2] <- [3]    [4] -> [5] -> 
#                        P      C      N

#          L      R            I=4 (stop reversing)
#  nil -> [1] -> [2] <- [3] <- [4]    [5] -> 
#                        P      C      N

#          L      R                   I=5 (stop iteration)
#  nil -> [1] -> [2] <- [3] <- [4]    [5] -> 
#                               P      C      N

#          L                   
#  nil -> [1] ---------------> [4]    I=5
#                [2] <- [3] <---┘     [5] -> 
#                 R             P      C      N

#          L                    
#  nil -> [1] ---------------> [4]
#      <- [5] <- [2] <- [3] <---┘     
#   N      C      R             P 


# Case 2: [1, 3] => 3->2->1->4->5
#   L      R                   I=4
#  nil <- [1] <- [2] <- [3]    [4] -> [5]
#                        P      C      N
# if L is dummy, point head to P

#   L      R            
#  nil    [1] <- [2] <- [3]    
#          |             P      C      N
#          └-----------------> [4] -> [5]
# point R to n                 I=4


# Case 3: [1, 2] => 2->1->
# 
# nil   [1] -> [2]
#  P     C      R