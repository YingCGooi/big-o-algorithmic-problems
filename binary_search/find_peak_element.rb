# A peak element is an element that is greater than its neighbors.

# Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.

# The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.

# You may imagine that nums[-1] = nums[n] = -∞.

def find_peak_element(arr)
  return arr.index(arr.max) if arr.length <= 2
  left = 0
  right = arr.length - 1
  mid = (left + right) / 2
  
  loop do
    mid = (left + right) / 2
    next_element = arr[mid + 1] || -Float::INFINITY
    prev_element = arr[mid - 1] || -Float::INFINITY

    if next_element > arr[mid] && left < right
      left = mid + 1
    elsif prev_element > arr[mid] && left < right
      right = mid - 1
    end

    break if peak?(arr[mid], next_element, prev_element)
  end

  return mid
end

def peak?(mid_value, next_element, prev_element)
  greater_than_next = mid_value > next_element
  greater_than_prev = mid_value > prev_element

  greater_than_next && greater_than_prev
end

p find_peak_element [1,2,3,1] # 2 - value 3 is a peak element
p find_peak_element [1, 2, 1, 3, 5, 6, 4] 
# # 1 - value 2 is a peak element OR
# # 5 - value 6 is a peak element
p find_peak_element [1, 2]
p find_peak_element [2, 1]
p find_peak_element [1, 2, 1]
p find_peak_element [2, 1, 2]
p find_peak_element [4, 3, 2, 1]
p find_peak_element [1, 2, 3, 4]
p find_peak_element [1,7,3,4,5,6,7]
# Algo1:
  [1, 2, 1, 3, 5, 6, 4] # check to see if max[a, b, c] == b
#  ^a ^b ^c
  [1, 2, 1, 3, 5, 6, 4] # check to see if max[a, b, c] == b
#     ^a ^b ^c
# O(N) complexity

# Algo2:
  [1, 2, 3, 4, 5, 6, 7, 8] # initialize pointers
#  ^L    ^a ^M ^b       ^R

  [1, 2, 3, 4, 5, 6, 7, 8] # if not a peak, check which neighbor is larger than M
#  ^L    ^a ^M ^b       ^R   right neighbor is larger than M

  [1, 2, 3, 4, 5, 6, 7, 8] # move left pointer to the index next to M
#           ^M ^L       ^R
#        ^a    ^b

  [1, 2, 3, 4, 5, 6, 7, 8] # recalculate midpoint
#              ^L ^M    ^R   
#              ^a    ^b

  [1, 2, 3, 4, 5, 6, 7, 8] # b > a, move left pointer to the index next to M
#                 ^M ^L ^R   
#              ^a    ^b

  [1, 2, 3, 4, 5, 6, 7, 8] # recalculate M
#                    ^L ^R    
#                 ^a ^M ^b

  [1, 2, 3, 4, 5, 6, 7, 8] # if M is the last element, return last element if left neighbor is smaller
#                       ^R 
#                       ^L   
#                    ^a ^M ^b(-INF)

# =====================
  [1, 2, 1, 3, 8, 6, 4] 
#  ^L       ^M       ^R
  [1, 2, 1, 3, 8, 6, 4] 
#              ^L ^M ^R
  [1, 2, 1, 3, 8, 6, 4] # if L == M, break loop, return M
#              ^L 
#              ^R
#              ^M

  [4, 3, 2, 1]
#  L  M     R

  [4, 3, 2, 1]
#        L  R
#        M

  [4, 3, 2, 1]
#        L  R
#        M