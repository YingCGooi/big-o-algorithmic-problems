# Write a program that uses binary search to return the index of a target value within a sorted array.
# If target element is not found, return nil

  [1, 4, 6, 7, 9, 12, 15, 16, 20] # Find 7
#  ^L          ^M             ^R  # M > 7

  [1, 4, 6, 7, 9, 12, 15, 16, 20] # Move R to the left of M
#  ^L       ^R ^M            

  [1, 4, 6, 7, 9, 12, 15, 16, 20] # Recalculate M = (L + R) / 2
#  ^L ^M    ^R                    # M < 7

  [1, 4, 6, 7, 9, 12, 15, 16, 20] # Move L to the right of M
#     ^M ^L ^R                    

  [1, 4, 6, 7, 9, 12, 15, 16, 20] # Recalculate M = (L + R) / 2
#        ^L ^R                    # M < 7
#        ^M

  [1, 4, 6, 7, 9, 12, 15, 16, 20] # Move L to the right of M
#           ^R                    
#        ^M ^L

  [1, 4, 6, 7, 9, 12, 15, 16, 20] # Move L to the right of M
#           ^R                    # Break the loop
#           ^L                    # check to see if M == target
#           ^M                    # if true, return M, else return nil

# Algo: O(log N)
  # initialize length to array.length
  # initialize left and right pointer on both ends
  # initialize midpoint as (left + right) / 2
  # until midpoint_value == target || left_pointer >= right_pointer
  #   if midpoint_value > target => right pointer = midpoint - 1
  #   if midpoint_value < target => left pointer = midpoint + 1
  #   midpoint = (left + right) / 2
  
  # return midpoint if midpoint_value == target
  # return nil

def binary_search(arr, target)
  left = 0
  right = arr.length - 1
  midpoint = (left + right) / 2

  until arr[midpoint] == target || left >= right
    right = midpoint - 1 if arr[midpoint] > target
    left = midpoint + 1  if arr[midpoint] < target
    midpoint = (left + right) / 2
  end

  return midpoint if arr[midpoint] == target
  nil
end

p binary_search([1, 4, 6, 7, 9, 12, 15, 16, 20], 7) # index = 3
p binary_search([1, 4, 6, 7, 9, 12, 15, 16, 20], 20) # index = 8
p binary_search([1, 2, 3], 2) # 1
p binary_search([1, 2], 2) # 1
p binary_search([2], 2) # 0
p binary_search([], 2) # nil
p binary_search([-3, -2, 1, 0], -2) # 1