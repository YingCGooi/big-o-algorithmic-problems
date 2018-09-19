# You are given a one dimensional array that may contain both positive and negative integers, find the sum of contiguous subarray of numbers which has the largest sum.
# For example, if the given array is [-2, -5, 6, -2, -3, 1, 5, -6], then the maximum subarray sum is 7 (see highlighted elements).

# Naive Approach:
# Double loops, outer loop picks the beginning element
# inner loop finds maximum possible sum
# compares current maximum with overall maximum
# return overall maximum
# O(N^2)

def maximum_sum(arr)
  mid = arr.length / 2
  maximum_sum_helper(arr, mid)
end

def maximum_sum_helper(arr, mid)
  left  = arr[0...mid]
  right = arr[mid..-1]

  left_maximum = maximum_sum_helper(left, mid)
  right_maximum = maximum_sum_helper(right, mid)
  cross_maximum = maximum_crossing_sum(left, right)

  return [left_maximum, right_maximum, cross_maximum].max
end

def maximum_crossing_sum(left, right)
  
end 

p maximum_sum [-2, -5, 6, -2, -3, 1, 5, -6] # 7
p maximum_sum [-2, 1] # 1
p maximum_sum [1] # 1

