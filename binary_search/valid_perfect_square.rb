# Given a positive integer num, write a function which returns True if num is a perfect square else False.

def is_perfect_square(target)
  return true if target == 1
  return false if target < 0

  left = 0
  right = target
  mid = target / 2
  count = 0

  until left >= right do
    current_square = mid ** 2

    return true if current_square == target
    right = mid - 1 if current_square > target
    left  = mid + 1 if current_square < target

    mid = (left + right) / 2
  end

  return true if mid ** 2 == target
  false
end

p is_perfect_square(0)
p is_perfect_square(1) # true => 1
p is_perfect_square(16) # true => 4
p is_perfect_square(14) # false
p is_perfect_square(625) # true => 25
p is_perfect_square(65025) # true => 255

  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ,15, 16] 
#  ^L                      ^M                            ^R  M_value^2 => 64 > target

  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ,15, 16] # Move R to the index before M
#  ^L                   ^R ^M                                

  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ,15, 16] # Re-calculate M
#  ^L       ^M          ^R                                     M_value^2 => 9 < target

  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ,15, 16] # Move L to the index next to M
#           ^M ^L       ^R             

  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ,15, 16] # Re-calculate M 
#              ^L ^M    ^R                                     M_val^2 => 25 > target

  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ,15, 16] # Re-calculate M 
#              ^L                                              L >= R => break loop
#              ^R                                              M_val^2 => 16 == target => return true
#              ^M

  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
# ^L                    ^M                       ^R

  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
# ^L                 ^R ^M                       

  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
# ^L        ^M       ^R  

  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
#           ^M ^L    ^R  

  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
#              ^L ^M ^R  

  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
#              ^L ^M   
#              ^R

  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14] # when L >= R, break loop
#              ^L   
#              ^R
#              ^M