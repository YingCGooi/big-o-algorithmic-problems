require 'set'
# Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).

# Note: The solution set must not contain duplicate subsets.


#                 1         2         2
#             x   2   2   1 x 2     1 2 x
#                xx2


#           0       1        2
#         x 1 2   0 x 2    0 1 x
#      xxx xx2 x1x...

def subsets_with_dup(arr)
  results = {}
  subsets_dup_helper(results, temp = [], arr)
  results.keys
end

def subsets_dup_helper(results, temp, arr)
  values = temp.map { |i| arr[i] }.sort
  results[values] = 1
  return if temp.size >= arr.size

  (0...arr.length).each do |i|
    # puts "results:#{results}, temp:#{temp}, i:#{i}"
    next if temp.include?(i)
    subsets_dup_helper(results, temp + [i], arr)
  end
end


p subsets_with_dup([1, 2, 2])
# [
#   [2],
#   [1],
#   [1,2,2],
#   [2,2],
#   [1,2],
#   []
# ]
p subsets_with_dup([1, 4, 4, 4])