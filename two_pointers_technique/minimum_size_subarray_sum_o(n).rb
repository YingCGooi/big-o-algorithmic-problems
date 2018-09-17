def min_sub_array_len(arr, target)
  left = 0
  right = 0
  last = arr.length - 1
  sum = arr[0] || 0
  result = nil

  until left > last || right > last
    subarray_length = right - left + 1
    if sum < target
      right += 1
      sum += arr[right] if arr[right]
    else
      result = subarray_length if result.nil? || subarray_length < result
      sum -= arr[left]
      left += 1
    end
  end

  return 0 if result.nil?
  result
end

p min_sub_array_len [2, 3, 1, 2, 4, 3], 7 # 2 => [4, 3]
p min_sub_array_len [2, 3, 1, 2, 4], 4 # 1 => [4]
p min_sub_array_len [2, 3, 1, 4, 2], 4 # 1 => [4]
p min_sub_array_len [], 5 # 0
p min_sub_array_len [2, 3, 1, 2, 9, 2], 7 # 1 => [9]
p min_sub_array_len [2, 3, 1, 2, 1, 2], 7 # 4 => [2, 3, 1, 2]
p min_sub_array_len [2, 3, 1, 2, 1, 2], 12 # 0