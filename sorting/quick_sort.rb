# Implement Quick Sort

def quick_sort!(arr)
  quick_sort_helper(arr, left = 0, right = arr.length - 1)
end

def quick_sort_helper(arr, left, right)
  return if left >= right
  pivot_position = partition!(arr, left, right)

  quick_sort_helper(arr, left, pivot_position - 1)
  quick_sort_helper(arr, pivot_position + 1, right)

  return arr
end

def partition!(arr, left, right)
  pivot_position = right
  pivot = arr[right]
  right -= 1  

  loop do
    left += 1 until arr[left] >= pivot
    right -= 1 until arr[right] <= pivot

    break if left >= right
    arr[left], arr[right] = arr[right], arr[left]
  end

  arr[pivot_position], arr[left] = arr[left], arr[pivot_position]
  left
end

p quick_sort!([0, 5, 2, 1, 6, 3])