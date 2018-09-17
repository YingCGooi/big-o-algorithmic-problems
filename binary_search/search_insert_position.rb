# Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

# You may assume no duplicates in the array.

# Naive Approach O(N)
# Iterate through every element, if current element >= target return the index

def search_insert(arr, target)
  arr.each_with_index do |element, index|
    return index if element >= target
  end
  arr.length
end

# Binary Search O(log(n))

def search_insert(arr, target)
  return 0 if arr.empty?
  left = 0
  right = arr.length - 1
  midpoint = (left + right) / 2

  until arr[midpoint] == target || left >= right
    right = midpoint - 1 if arr[midpoint] > target
    left = midpoint + 1  if arr[midpoint] < target
    midpoint = (left + right) / 2
  end

  return 0 if midpoint < 0
  return midpoint if arr[midpoint] >= target
  midpoint + 1
end

p search_insert [1, 3, 5, 6], 5 # 2
p search_insert [1, 3, 5, 6], 2 # 1
p search_insert [1, 3, 5, 6], 7 # 4
p search_insert [1, 3, 5, 6], 0 # 0
p search_insert [], 5 # 0
p search_insert [-3, -2, 0, 2, 6], -9 # 0
p search_insert [-3, -2, 0, 2, 6], 10 # 5

  [1, 3, 5, 6]   # left = 0; right = 3, target  = 5
#  ^L ^M    ^R   # midpoint = (left + right) / 2 = 1
  [1, 3, 5, 6]   # midpoint_value = 3 < 5
#     ^M ^L ^R   # left pointer move to one next to midpoint
  [1, 3, 5, 6]   # recalculate midpoint = (3 + 4) / 2 => 3
#        ^L ^R   # left pointer move to one next to midpoint
#        ^M


  [1, 3, 5, 6]   # left = 0; right = 3, target = 2
#  ^L ^M    ^R   # midpoint = (left + right) / 2 = 1
  [1, 3, 5, 6]   # midpoint_value = 3 > 2
#  ^L ^M         # right pointer move to the prev index of midpoint
#  ^R
  [1, 3, 5, 6]   # recalculate midpoint => 0
#  ^L            # right pointer move to the prev index of midpoint
#  ^R            # left pointer >= right pointer, break loop
#  ^M           
  [1, 3, 5, 6]   # midpoint_value < target
#     ^M         # return midpoint + 1