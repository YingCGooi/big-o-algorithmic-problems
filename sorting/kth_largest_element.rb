# Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

# Example 1:

# Input: [3,2,1,5,6,4] and k = 2
# Output: 5
# Example 2:

# Input: [3,2,3,1,2,4,5,5,6] and k = 4
# Output: 4

# Partition the array
# Initialize pivot
# Assign pointers => left pointer at index 0
# right pointer at one less than pivot itself
# left pointer moves one cell to the right until reaches a value that is greater than or equal to pivot
# right pointer moves one cell to the left until it reaches a value that is less than or equal to the pivot
# Swap the values that left and right pointers are pointing to
# Continue until pointers are pointing to the same value or left pointer moved to the right of the right pointer
# swap the pivot with the value that the left pointer is pointing to.

# partition the arr
# if pivot position == last kth element in the array, return arr[pivot_position]
# if pivot position < last kth element in the array, partition right portion
# if pivot position > last, partition left

# [3,2,1,5,6,4] length = 6, k = 2
#          ^    index = 4 (length - k)

# [3,2,3,1,2,4,5,5,6] length = 9, k = 4
#            ^        index = 5 (length - k)

def find_kth_largest(arr, k)
  last_kth_index = arr.length - k
  find_kth_largest_helper(arr, last_kth_index, 0, arr.length - 1)
end

def find_kth_largest_helper(arr, last_kth_index, left = 0, right = arr.length - 1)
  return arr[left] if left  >= right

  pivot_position = partition!(arr, left, right)

  if pivot_position > last_kth_index
    find_kth_largest_helper(arr, last_kth_index, left, pivot_position - 1)

  elsif pivot_position < last_kth_index
    find_kth_largest_helper(arr, last_kth_index, pivot_position + 1, right)

  else
    return arr[pivot_position]
  end
end

def partition!(arr, left, right)
  pivot_position = right
  pivot = arr[right]
  right -= 1  

  loop do
    left += 1 until arr[left] >= pivot
    right -= 1 until arr[right] <= pivot

    break if left >= right || arr[left] == arr[right]
    arr[left], arr[right] = arr[right], arr[left]
  end

  arr[pivot_position], arr[left] = arr[left], arr[pivot_position]
  left
end

p partition!([0, 5, 2, 1, 6, 3], 0, 5) # [0, 1, 2, 3, 6, 5]
p find_kth_largest([99, 99], 1)
p find_kth_largest([3, 3, 3, 3, 3], 1)
p find_kth_largest([0, 5, 2, 1, 6, 3], 1)
p find_kth_largest([3,2,1,5,6,4], 2)
p find_kth_largest([3,2,3,1,2,4,5,5,6], 4)
p find_kth_largest([3,2,3,1,2,4,5,5,6,7,7,8,2,3,1,1,1,10,11,5,6,2,4,7,8,5,6], 2)
