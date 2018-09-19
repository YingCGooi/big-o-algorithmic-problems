# Find the maximum number in an array of numbers. Return that number.

def max(arr)
  max_helper(arr, arr[0], 0)
end

def max_helper(arr, acc, index)
  return acc if index >= arr.length

  acc = arr[index] if arr[index] > acc

  max_helper(arr, acc, index + 1)
end
# O(1) space using TCO, otherwise O(N) time
# O(N) time

p max [1, 2, 3, 4, 5] # 5
p max [2, 9, 0] # 9
p max [1] # 1
p max [] # nil