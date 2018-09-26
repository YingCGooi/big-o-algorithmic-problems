# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Example:

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

# Input: two linked lists
# Output: an integer (sum of digit representations of the two linked lists)

# (2 -> 4 -> 3)
# [3,4,2] 
# '342'
# 342

# (5 -> 6 -> 4)
# [4,6,5]
# '465'
# 465

# 342 + 465 = 807
# '807'
# ['7','0','8']
# [7, 0, 8]
# 7 -> 0 -> 8

# Time: O(first_n + second_n + number_digits_in_result_sum)
# Space: O(N1 + N2 + (number_of_digits_sum))

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

# num1 = 2*10^0 + 4*10^1 + 3*10^2 => val_at_node * (10 ^ count) 
# num2 = 5 + 60 + 400 = 465
# num1 + num2 => sum
# Time: O(first_n + second_n + number_digits_in_result_sum)
# Space: O(1 + 1 + (number_of_digits_sum))

class Node
  attr_accessor :val, :next

  def initialize(val, nex=nil)
    @val = val
    @next = nex
  end
end

def sum_two_lists(head1, head2)
  num1 = 0
  count1 = 0
  num2 = 0
  count2 = 0

  curr1 = head1
  curr2 = head2

  until curr1.nil?
    num1 += curr1.val * (10 ** count1)
    curr1 = curr1.next
    count1 += 1
  end

  until curr2.nil?
    num2 += curr2.val * (10 ** count2)
    curr2 = curr2.next
    count2 += 1
  end  

  sum = num1 + num2

  num_arr = sum.to_s.chars

  dummy = Node.new(nil)
  dummy.next = Node.new(num_arr[-1].to_i)
  prev, current = dummy, dummy.next

  num_arr.reverse_each.with_index do |num, index|
    current = Node.new(num.to_i) if index != 0
    prev.next = current
    prev = current
    current = current.next
  end

  dummy.next
end

# D -> 7, 0, 8
# P    C 

# D -> 7 -> 0, 8
#      P    C 

# D [7, 0, 8]
#       P  C 

node1 = Node.new(2)
node1.next = Node.new(4)
node1.next.next = Node.new(3)

node2 = Node.new(5)
node2.next = Node.new(6)
node2.next.next = Node.new(4)

p sum_two_lists(node1, node2) # 7 -> 0 -> 8
