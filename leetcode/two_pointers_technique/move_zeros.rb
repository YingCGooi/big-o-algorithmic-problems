# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

def move_zeros(arr)
  # initialize count
  # move pointer
  # if pointer value == 0, splice the array
  # after iteration, append all 0s to the end of array

  # O(N) attempt
  # iterate through array
  # otherwise, copy the rest of the elements into a new array
  # append (count) number of 0s at the end of the array

  zero_count = 0
  result = []

  arr.each_with_index do |num|
    if num == 0
      zero_count += 1
      next
    end
    result.push(num)
  end

  zero_count.times { result.push(0) }

  result
end

# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]
p move_zeros([0,1,0,3,12]) # [1,3,12,0,0]
# { 0 => true, 2 => true }
# [nil, 1, nil, 3, 12]
p move_zeros([0, 1, 2, 3, 0, 0, 0, 0, 5]) # [1, 2, 3, 5, 0, 0, 0, 0, 0]
p move_zeros([]) # []
p move_zeros([0]) # [0]
p move_zeros([0, 0, 0]) # [0, 0, 0]
p move_zeros([5, 6, 0, 0, 0]) # [5, 6, 0, 0, 0]
