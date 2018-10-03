# You are given a list of non-negative integers, a1, a2, ..., an, and a target, S. Now you have 2 symbols + and -. For each integer, you should choose one from + and - as its new symbol.

# Find out how many ways to assign symbols to make sum of integers equal to target S.

# Input: nums is [1, 1, 1, 1, 1], S is 3. 
# Output: 5
# Explanation: 

# -1+1+1+1+1 = 3
# +1-1+1+1+1 = 3
# +1+1-1+1+1 = 3
# +1+1+1-1+1 = 3
# +1+1+1+1-1 = 3

# There are 5 ways to assign symbols to make the sum of nums be target 3.

# The length of the given array is positive and will not exceed 20.
# The sum of elements in the given array will not exceed 1000.
# Your output answer is guaranteed to be fitted in a 32-bit integer.

p find_target_sum_arrays([1, 1, 1, 1, 1], 3) # 5


[1, 2, 1, 1, 2], 3


# 1 + 2 - 1 - 1 + 2 = 3

# Brute Force
# Collect all possible outcomes
# count how many totals that are equal to target value

# Start from the end
# [x, x, x, x, 1] (4, 2) => 3
# => the first four has to sum to 4 (3+1) or 2 (3-2)

# [x, x, x, 1, 1] (3, 5, 1, 3) => (4, 2) => 3
# => the first three has to sum to 3, 5, or 1, 3

# [x, x, 1, 1, 1] 
# (2, 4, 4, 6, 0, 2, 2, 4) => (3, 5, 1, 3) => (4, 2) => 3
# => the first two has to sum to 1, 4, 4, 6, 0, 2, 2, 4

# [x, 1, 1, 1, 1] 
# (1, 3, 3, 5, 3, 5, 5, 7, -1, 1, 1, 3, 1, 3, 3, 5) => (2, 4, 4, 6, 0, 2, 2, 4) => (3, 5, 1, 3) => (4, 2) => 3
# The first one has to be equal any of the values in the set
# count the number of occurences in the first set where it is equal to 1 or -1

# [x, x, x, x, a] (t + 1, t - a) => t

# [x, x, x, b, a] ((t + a) + b, (t + a) - b, (t - a) + b, (t + a) - b) => t

def find_target_sum_arrays(arr, target)
  helper(arr, target, arr.length - 1, [], 0)
end

def helper(arr, target, index, possibilities, sum)
  return count_of_valid_matches(arr[0], possibilities) if index == 0


  sum += helper(arr, target, index - 1, possibilities, sum)
end