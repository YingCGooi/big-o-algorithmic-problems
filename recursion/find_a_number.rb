# Find a number in an array and return its index. If not found, return -1

def index_of(arr, target)
  index_of_helper(arr, 0, target)
end

def index_of_helper(arr, index, target)
  return -1 if index >= arr.length
  return index if arr[index] == target

  index_of_helper(arr, index + 1, target)
end
# Space O(1) if TCO, otherwise O(N)
# Time O(N)

p index_of [7, -8, 0, 0, 0, 0, 0, -8], -8 # 1
p index_of [1, 2, 9, 5, 6, 7, 8, 7], 6 # 4
p index_of [1, 1], 6 # -1
p index_of [], 6 # -1