# Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.

# The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.

# Your returned answers (both index1 and index2) are not zero-based.
# You may assume that each input would have exactly one solution and you may not use the same element twice.

# Approach:
# initialize pointers at start and end (start = 1, end = arr.length - 1)
# while start pointer !== end pointer
# if sum(pointer values) == target => return [start pointer, end pointer]
# if sum(pointer values) < target => move start pointer to the next element
# if sum(pointer values) > target => move end pointer to the prev element

def two_sum(arr, target)
  left = 1
  right = arr.length

  while left != right
    sum = arr[left - 1] + arr[right - 1]
    return [left, right] if sum == target
    left  += 1 if sum < target
    right -= 1 if sum > target
  end

  false
end

p two_sum([2,7,11,15], 9)
# Output: [1,2]
p two_sum([1, 2], 3)
# [1, 2]
p two_sum([1, 2, 4, 5], 7)
# [2, 4]
p two_sum([-8, -5, -4, -2, 2, 5, 6], -7)
# [2, 4]