# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

def min_sub_array_len(arr, target)
  left = 0
  right = 0
  result = 0
  last = arr.length - 1

  return result if arr.empty? || arr.reduce(:+) < target

  until left > last || right > last
    return 1 if left == right && arr[left] >= target

    subarray = arr[left..right]

    this_subarray_is_shortest = (result == 0 || subarray.length < result)

    sum = subarray.reduce(:+)

    if sum >= target 
      result = subarray.length if this_subarray_is_shortest
      left += 1
    else
      right += 1
    end
  end

  result
end

p min_sub_array_len [2, 3, 1, 2, 4, 3], 7 # 2
# Explanation: the subarray [4,3] has the minimal length under the problem constraint.
p min_sub_array_len [2, 3, 1, 2, 4], 4 # 1 => [4]
p min_sub_array_len [2, 3, 1, 4, 2], 4 # 1 => [4]
p min_sub_array_len [], 5 # 0
p min_sub_array_len [2, 3, 1, 2, 9, 2], 7 # 1 => [9]
p min_sub_array_len [2, 3, 1, 2, 1, 2], 7 # 4 => [2, 3, 1, 2]
p min_sub_array_len [2, 3, 1, 2, 1, 2], 12 # 0

# Algo1: O(N^2)
# left pointer starts at index 0
# right pointer starts at index 0  
# loop:
# subarray is all elements between left and right pointer
# sum all elements between left pointer and right pointer
# if sum >= target, assign subarray.length to result if subarray.length < result
#  => move left pointer to the right
# if sum < target, move right pointer to the next element
# next iteration
# break when either left or right exceeds last index

# optimize to O(N): have a sum variable and keep track of the running sum
# subtract any prev values if left pointer is incremented
# initialize result to nil

 [2, 3, 1, 2, 4, 3] # sum = 2, subarray_length = 1, sum < target, target = 7
# ^^
 [2, 3, 1, 2, 4, 3] # sum = 5, subarray_length = 2, sum < target
# ^  ^
 [2, 3, 1, 2, 4, 3] # sum = 6, subarray_length = 3, sum < target
# ^     ^
 [2, 3, 1, 2, 4, 3] # sum = 8, subarray_length = 4, sum >= target => save the subarray_length into result
# ^        ^        # result = 4, move the left pointer to the next index

 [2, 3, 1, 2, 4, 3] # sum = 6, subarray_length = 3, sum < target
#    ^     ^        # result = 4

 [2, 3, 1, 2, 4, 3] # sum = 10, subarray_length = 4, sum >= target => move left pointer to the next index
#    ^        ^     # result = 4, (subarray_length >= result) => do not save

 [2, 3, 1, 2, 4, 3] # sum = 7, subarray_length = 3, sum >= target => move left pointer to the next index
#       ^     ^     # result = 3, since (subarray_length < result) => save to result

 [2, 3, 1, 2, 4, 3] # sum = 6, subarray_length = 2, sum < target, move right pointer to the next index
#          ^  ^     # result = 3,

 [2, 3, 1, 2, 4, 3] # sum = 9, subarray_length = 3, sum >= target, move left pointer to the next index
#          ^     ^  # result = 3, (subarray_length >= result) => do not save

 [2, 3, 1, 2, 4, 3] # sum = 7, subarray_length = 2, sum >= target, move left pointer to the next index
#             ^  ^  # result = 2, since (subarray_length < result) => save to result

 [2, 3, 1, 2, 4, 3] # sum = 3, subarray_length = 2, sum >= target
#                ^^  # result = 2, since (subarray_length < result) => save to result
# left and right pointers hit the end => stop iteration
# return result

# [1, 2, 2, 3, 3, 4, 5, 6, 8, 9] # 7
                         # ^  ^
# [1, 2, 2, 3, 3] # 7
          # ^  ^
# Algo2:
# sort the array (n*log n)
# initialize n as 1
# => if sum(first window) < target, increase window size
# => window slide of size n to the left until sum(elements in window) <= target
# => if sum(elements in window) < target, return prev window as subarray
# => if sum(elements in window) == target, return current window as subarray