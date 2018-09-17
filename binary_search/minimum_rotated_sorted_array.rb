# Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

# (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

# Find the minimum element.

# You may assume no duplicate exists in the array.
def find_min(arr)
  return arr[0] if arr.length == 1

  left = 0
  right = arr.length - 1

  loop do
    mid = (left + right) / 2

    prev_value = arr[mid - 1]
    curr_value = arr[mid]
    next_value = arr[mid + 1]

    return curr_value if prev_value && prev_value > curr_value
    return next_value if next_value && curr_value > next_value

    curr_value < arr[right] ? right = mid - 1 : left = mid + 1
  end
end

p find_min [0, 1, 2, 3, 4] # 0
p find_min [3,4,5,1,2] # 1
p find_min [4,5,6,7,0,1,2] # 0
p find_min [ 7, 0, 1, 2, 4, 5, 6 ] # 0
p find_min [ 4, 5, 6, 7, 0, 1, 2 ] # 0
p find_min [2, 3, 4, 0] # 0
p find_min [2, 1] # 1
p find_min [-2, -1, 1, 2, -4] # -4
# Algorithm
# Case 1 - min value on left hand side
  [ 7, 0, 1, 2, 4, 5, 6 ] # M value < R value => min value is on the left side
#   L     ^  M  ^     R     prev value < M value < next value => no min found

  [ 7, 0, 1, 2, 4, 5, 6 ] # Move R to the index left of M
#   L     R  M      

  [ 7, 0, 1, 2, 4, 5, 6 ] # Re-calculate M
#   L^ M  R^                prev value > M => M is min value

# Case 2 - min value on right hand side
  [ 1, 2, 4, 5, 6, 7, 0 ] # M value > R value => min value is on the right side
#   L     ^  M  ^     R     prev value < M value < next value => no min found

  [ 1, 2, 4, 5, 6, 7, 0 ] # Move L to index right of M
#            M  L     R     

  [ 1, 2, 4, 5, 6, 7, 0 ] # Re-calculate M
#               L^ M  R^    M > next value => next value is min value

# Case 3 - min value is just to the right of M
  [ 4, 5, 6, 7, 0, 1, 2 ] # M value > R value
#   L     ^  M  ^     R     M > next value => next value is min value

# Case 4 - array with 2 values
  [2, 1] # M > next value => next value is min value
#  L  R
#  M  ^

# Case 5 - array with 4 values
  [2, 3, 4, 0]
#  L^ M  ^  R
  [2, 3, 4, 0]
#     M  L  R
  [2, 3, 4, 0]
#        L  R
#     ^  M  ^