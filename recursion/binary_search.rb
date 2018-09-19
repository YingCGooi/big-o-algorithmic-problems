# implement binary search return -1 if value is not found, otherwise, return index

def binary_search(arr, target)
  left = 0
  right = arr.length - 1
  binary_search_helper(arr, target, left, right)
end

def binary_search_helper(arr, target, left, right)
  mid = (left + right) / 2
  curr_value = arr[mid]

  return -1 if left > right

  if curr_value == target
    return mid
  elsif curr_value > target
    binary_search_helper(arr, target, left, mid - 1)
  else
    binary_search_helper(arr, target, mid + 1, right)
  end
end

p binary_search [1, 2, 3, 4], 2 # 1
p binary_search [1, 2, 3, 4] , 5 # -1
p binary_search [], 6 # -1
p binary_search [0], 0 # 0
p binary_search [1, 2, 3, 4, 7, 9], 4 # 3