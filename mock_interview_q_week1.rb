# Given two arrays, write a function to compute their intersection.
# Each element in the result must be unique.
# The result can be in any order.
def intersection(nums1, nums2)
  hsh = {}
  result = []

  nums1.each do |num|
    hsh[num] = true
  end

  nums2.each do |num|
    if hsh[num]
      result.push(num) 
      hsh[num] = false
    end
  end

  result
end

def intersection(nums1, nums2)
  sorted1 = nums1.sort
  sorted2 = nums2.sort

  sorted1.each do |num|

  end
end

nums1 = [1,2,2,1]
nums2 = [2,2]
p intersection(nums1, nums2) # [2]

nums1 = [9,4,9,8,4]
nums2 = [9,4]
p intersection(nums1, nums2) # [9, 4]

# Brute force
# Iterate through nums1
# For each element, iterate through nums2
# if found, push result to new array

# Hash table
# iterate through nums1
# create key[value] = true
# iterate through nums2
# if key is found in hash_table, push it into result

[9, 4, 9, 8, 4]
[9, 4, 1]

# sort
[4, 4, 8, 9, 9] # <- for each element, run binary search, if found, next iteration
[1, 4, 9] # <- iterate through this array

[4, 4, 8, 9, 9]
[]
