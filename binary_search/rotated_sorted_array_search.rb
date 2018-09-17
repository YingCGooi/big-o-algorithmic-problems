# Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

# (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

# You are given a target value to search. If found in the array return its index, otherwise return -1.

# You may assume no duplicate exists in the array.

# Your algorithm's runtime complexity must be in the order of O(log n).



def search(arr, target)
  return 0 if arr.length === 1 && target == arr[0]
  left = 0
  right = arr.length - 1
  mid = (left + right) / 2

  until left > right || (mid == left && mid == right)
    mid = (left + right) / 2
    curr_val = arr[mid]
    left_val = arr[left]
    right_val = arr[right]

    return mid if target == curr_val
    next right = mid - 1  if target.between?(left_val, curr_val)
    next left = mid + 1 if target.between?(curr_val, right_val)
    next right = mid - 1 if left_val > curr_val
    next left = mid + 1 if left_val < curr_val   
  end

  return -1
end


p search [4,5,6,7,0,1,2], 0 # 4
p search [4,5,6,7,0,1,2], 3 # -1
p search [0, 1, 2, 4, 5, 6, 7], 1 # 1
p search [], 4 # -1
p search [2], 2 # 0
p search [2, 3], 3 # 1
p search [2, 3], 2 # 0

x = nil
# Case 1
  [4, 5, 6, 7, 0, 1, 2] # target = 0
  [4, x, x, 7, x, x, 2] # target not in between L and M; not in between M and R
#  L        M        R  # M > R => right hand side

# Case 2
  [0, 1, 2, 4, 5, 6, 7] # target = 1
  [0, x, x, 4, x, x, 7] # L value < target < M value => left hand side
#  L        M        R    

# Case 3
  [4, 5, 6, 7, 0, 1, 2] # target = 5
  [4, x, x, 7, x, x, 2] # target in between L and M
#  L        M        R  # => left hand side 

# Case 4
  [7, 0, 1, 2, 4, 5, 6] # target = 0
  [7, x, x, 2, x, x, 6] # target not in between L and M; not in between M and R
 # L        M        R  # L val > M val => left hand side

 # Case 5
  [7, 0, 1, 2, 4, 5, 6] # target = 4
  [7, x, x, 2, x, x, 6] # target in between M and R
 # L        M        R  # => right hand side

  # Case 5
  [7, 0, 1, 2, 4, 5, 6] # target = 9
  [7, x, x, 2, x, x, 6] # L val > M val
 # L        M        R  # => right hand side

   # Case 5
  [7, 0, 1, 2, 4, 5, 6] # Break if L > R
  [7, x, x, 2, x, x, 6] # 
 #                   MR  L  # 