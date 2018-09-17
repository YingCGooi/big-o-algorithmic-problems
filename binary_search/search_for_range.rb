# Given a sorted array of integers, find the starting and ending position of a given target value. Your algorithm's runtime complexity must be in the order of O(log n). If the target is not found in the array, return [-1, -1]. For example, given [5, 7, 7, 8, 8, 10] and target value 8, return [3, 4].

# Mental Model
# Case 1
  [5, 6, 6, 7, 7, 8, 8, 10] # target = 8
#  L        M            R  # initialize pointers: find left boundary

  [5, 6, 6, 7, 7, 8, 8, 10] # run binary search until the target value is found
#           M  L         R  

  [5, 6, 6, 7, 7, 8, 8, 10] # target is found, midpoint == 8, prev_value < 8, left boundary is found
#              L^ M      R 



# Case 2 - left boundary
  [5, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 10] # target = 8
#  L                    M                     R  # initialize pointers: find left boundary

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # run binary search until the target value is found
#                       M  L                  R

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # midpoint == 8 => target found, compare prev_value == target
#                          L     ^  M         R  # if true, left boundary is on left hand side

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # Move right pointer to previous index of midpoint
#                          L     R  M            

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # Re-calculate midpoint, midpoint == 8 => target found
#                          L^ M  R               # prev_value == target

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # Run binary search again, midpoint == 8 => target found
#                       ^  L                     # prev_value < target => left boundary = midpoint
#                          R
#                          M

def search_for_range(arr, target)
  left = 0
  right = arr.length - 1
  mid = (left + right) / 2

  start_index = -1
  end_index = -1

  until left > right do
    prev_value = arr[mid - 1]
    curr_value = arr[mid]
    next_value = arr[mid + 1]

    p [prev_value, curr_value, next_value, left: left, mid: mid, right: right]

    if curr_value == target
      if prev_value == target
        right = mid - 1 
      elsif 
        break start_index = mid
      end
    elsif curr_value < target
      left = mid + 1
    else
      right = mid - 1
    end
    
    mid = (left + right) / 2
  end

  return start_index
end

p search_for_range [5, 7, 7, 8, 8, 10], 8 # [3, 4]
p search_for_range [5, 7, 7, 10], 8 # [-1, -1]
p search_for_range [5, 5, 5, 5], 5 # [0, 3]
p search_for_range [5], 5 # [0, 0]
p search_for_range [], 5 # [-1, -1]
p search_for_range [-81, -80, -60, -4, -4], -60 # [2, 2]

# Case 2 - right boundary
  [5, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 10] # target = 8
#  L                    M                     R  # initialize pointers: find right boundary

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # run binary search until the target value is found
#                       M  L                  R

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # midpoint == 8 => target found, compare next_value to target
#                          L        M  ^      R  # right_boundary is on right hand side

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # Run binary search
#                                      L  M   R

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # midpoint == 8 => target found, next_value > target
#                                      L  M  ^R  # right boundary = midpoint
                                                 # return [left_boundary, right_boundary] 

# Case 3
  [5, 6, 6, 7, 7, 7, 7, 7, 9, 9, 9, 9, 9, 9, 10] # if L >= R and M != target value
#                       ^  L                     # then value is not found, return [-1, -1]
#                          R
#                          M