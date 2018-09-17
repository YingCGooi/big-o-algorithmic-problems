# Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
# Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

# Sort the array - runtime of O(n log n)
# Initialize writer pointer at index 0 and reader pointer at index 1
# Compare the value of reader and writer pointers
# If they are not equal, advance both pointers to the next indices
# If they are equal, advance only the reader pointer until a non-equal value is found, then replace the value of writer pointer to the value of reader pointer
# Repeat the compare, advance and writing steps above until the right pointer arrives at the end of the array
# Drop the elements to the right of the left pointer

# initialize left_pointer = 0
# initialize right_pointer = 1
# until right pointer hits the last element
  # move right pointer until right_pointer_value > left_pointer_value
  # move left pointer to the right
  # left_pointer_value = right_pointer_value
  # move right pointer until right_pointer_value > left_pointer_value
# drop all elements after left pointer
# O(2N) => O(N) or O(N^2)??

def remove_duplicates(arr)
  left = 0
  right = 1
  last = arr.length - 1

  while right < arr.length - 1
    right += 1 until arr[right] > arr[left] || right == last
    break if arr[right] == arr[left] && right == last
    left += 1
    arr[left] = arr[right]
  end

  arr.pop while arr.length > left + 1

  arr
end

p remove_duplicates [1,1,2] # [1, 2]
p remove_duplicates [0,1,2,3,4,2,2,3,3,4] # [0, 1, 2, 3, 4]
p remove_duplicates [] # []
p remove_duplicates [2, 2, 2, 3, 4, 3, 4, 4, 4]
p remove_duplicates [2, 2, 2, 2, 2] # [2]
p remove_duplicates [0]

  [0, 1, 2, 3, 4, 2, 2, 3, 3, 4]
  [0, 1, 2, 3, 4, 2, 2, 3, 3, 4]
#          ^         ^
