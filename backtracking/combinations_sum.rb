# Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

# The same repeated number may be chosen from candidates unlimited number of times.

# Note:

# All numbers (including target) will be positive integers.
# The solution set must not contain duplicate combinations.

#               2              3           5
#             / | \          / | \       / | \
#            /  |  \        /  |  \     /  |  \
#           2   3   5      2   3   5   2   3   5
#          /|\
#         2 3 5
#        /|\
#       2 3 5
#   [2,2,2,2] == 8, push to result
#   [2,2,2,3] > 8, return

# iterate through the array
# save current value to temp
# traverse one level down
# iterate through the array
# save current value to temp
# if temp.sum == target, push into result
# if temp.sum > target, return

def combination_sum(arr, target)
  arr.sort!
  combination_sum_helper(result = [], temp = [], arr, target, 0)
end

def combination_sum_helper(result, temp, arr, target, sum)
  return result << temp if sum == target

  arr.each do |num|
    # puts "result:#{result}, temp: #{temp}, target: #{target}, sum: #{sum}, num: #{num}"    
    next if sum > target || (temp.last && temp.last > num)
    temp = temp + [num]
    combination_sum_helper(result, temp, arr, target, sum + num)
    temp = temp[0...-1]
  end

  return result
end

# p combination_sum([2, 3, 6, 7], 7) 
# [
#   [7],
#   [2,2,3]
# ]

p combination_sum([2, 3, 5], 8)
# [
#   [2,2,2,2],
#   [2,3,3],
#   [3,5]
# ]