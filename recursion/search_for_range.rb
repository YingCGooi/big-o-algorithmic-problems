# Given a sorted array of integers, find the starting and ending position of a given target value. Your algorithm's runtime complexity must be in the order of O(log n). If the target is not found in the array, return [-1, -1]. For example, given [5, 7, 7, 8, 8, 10] and target value 8, return [3, 4].

def search_for_range(arr, target)
  start, ending = [-1, -1]

  start = binary_search_start(arr, target, 0, arr.length - 1)
  ending = binary_search_end(arr, target, 0, arr.length - 1)

  return [start, ending]
end

def binary_search_start(arr, target, left, right)
  mid = (left + right) / 2
  curr_val = arr[mid]
  prev_val = arr[mid - 1]

  return -1 if left > right

  if found?(curr_val, target)
    return mid if left_edge?(prev_val, curr_val, mid)
    return binary_search_start(arr, target, left, mid - 1)
  elsif curr_val > target
    return binary_search_start(arr, target, left, mid - 1)
  else
    return binary_search_start(arr, target, mid + 1, right)
  end
end

def binary_search_end(arr, target, left, right)
  mid = (left + right) / 2
  curr_val = arr[mid]
  next_val = arr[mid + 1]

  return - 1 if left > right

  if found?(curr_val, target)
    return mid if right_edge?(curr_val, next_val, mid)
    return binary_search_end(arr, target, mid + 1, right)
  elsif curr_val > target
    return binary_search_end(arr, target, left, mid - 1)
  else
    return binary_search_end(arr, target, mid + 1, right)
  end
end

def left_edge?(prev_val, curr_val, mid)
  prev_val != curr_val || mid == 0
end

def right_edge?(curr_val, next_val, mid)
  curr_val != next_val || next_val.nil?
end

def found?(curr_val, target)
  curr_val == target
end

p search_for_range [5, 7, 7, 8, 8, 10], 8 # [3, 4]
p search_for_range [5, 7, 7, 10], 8 # [-1, -1]
p search_for_range [5, 5, 5, 5], 5 # [0, 3]
p search_for_range [5], 5 # [0, 0]
p search_for_range [], 5 # [-1, -1]
p search_for_range [-81, -80, -60, -4, -4], -60 # [2, 2]