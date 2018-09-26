# Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.

# You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.

# Example 1:

# Input: 1->2->3->4->5->NULL
# Output: 1->3->5->2->4->NULL


# Input: 2->1->3->5->6->4->7->NULL
# Output: 2->3->6->7->1->5->4->NULL


# The relative order inside both the even and odd groups should remain as it was in the input.
# The first node is considered odd, the second node even and so on

#      E
# 1 -> 2 -> 3 -> 4 -> 5 -> NULL
# P    C    N


# 1 ------> 3 -> 4 -> 5 -> NULL # prev.next = nex
#      2 --/
# P    C    N


# 1 ------> 3 -> 4 -> 5 -> NULL
#      2 --/
#      P    C    N


# 1 ------> 3 -> 4 -> 5 -> NULL # prev.next = nex
#      2 --------/
#      P    C    N


# 1 ------> 3 -> 4 -> 5 -> NULL
#      2 --------/
#           P    C    N


# 1 ------> 3 ------> 5 -> NULL # prev.next = nex
#      2 --------4---/
#           P    C    N


# 1 ------> 3 ------> 5 -> NULL 
#      2 --------4---/
#                P    C    N

#      E
# 1 ------> 3 ------> 5 -> NULL 
#      2 --------4---------/    # prev.next = nex  
#                P    C    N

#                          E
# 1 ------> 3 ------> 5 -> 2 
#         ________________/
#        /-----> 4------> NULL    # curr.next = even_start
#                P    C    N


# 1 ---> nil

# 1 -> 2 -> nil
# P    C    N

# 1 -> 2 -> nil
# P    C    N