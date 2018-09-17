require_relative "node_module"
# Given a sorted linked list, delete all duplicates such that each element appear only once.

def delete_duplicates(head)
  return nil if head.nil?
  return head if head.next.nil?

  curr, nex = head, head.next

  until nex.nil?
    if curr.val == nex.val
  end

  head
end

puts n([1, 1, 2])
puts delete_duplicates n([1, 1, 2])  # 1 -> 2
puts delete_duplicates n([1, 1, 2, 3, 3])  # 1 -> 2 -> 3

#       S
#       1 -> 1 -> 1 -> 2 -> 3 -> 3 ->  # C == N => duplicates exist, start = C
#       C    N

#       S
#       1 -> 1 -> 1 -> 2 -> 3 -> 3 ->  # C == N => duplicates exist, continue
#            C    N

#       S              E     
#       1 -> 1 -> 1 -> 2 -> 3 -> 3 ->  # C != N => end = N
#                 C    N

#       S              E
#       1 -----------> 2 -> 3 -> 3 ->  # start.next = end
#         -> 1 -> 1
#                 C    N

#       1 -----------> 2 -> 3 -> 3 ->  # reassign pointers, C != N, continue
#                      C    N

#                           S
#       1 -----------> 2 -> 3 -> 3 ->  # C == N, duplicates exist, start = C, continue
#                           C    N

#                           S         E
#       1 -----------> 2 -> 3 -> 3 ->  # C != N, N is nil, break loop, 
#                                C    N

#                           S         E
#       1 -----------> 2 -> 3 ------->  # start.next = end
#                                C    N