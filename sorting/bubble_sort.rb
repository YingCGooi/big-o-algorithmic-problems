# implement bubble sort

# do a window slide of 2
# compare 2 elements
# swap if first element > second element
# repeat until the first window slide does not perform any more swaps
# stop

def bubble_sort!(arr)
  arr.size.times do
    swapped = false

    arr.each_with_index do |num, index|
      break if index >= arr.length - 1

      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        swapped = true
      end
    end

    break if !swapped
  end
  return arr
end

p bubble_sort!([0, 5, 2, 1, 6, 3])