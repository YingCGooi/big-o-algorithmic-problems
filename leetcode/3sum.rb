# Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

# Note:

# The solution set must not contain duplicate triplets.

# Given array 
nums = [-1, 0, 1, 2, -1, -4]

# A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]

# Iterate through the array
# For each element, iterate through the remaining array
# Then again, for each element, iterate through the remaining array
# check to see if a + b + c == 0, if true, push to result array if the result array does not contain any sets that have the current triplets
# O(N^3)

# Algo2:
  [-1, 0, 1, 2, -1, -4] # need to find a + b + c == 0

  [-4, -1, -1, 0, 1, 2] # sort the array (n log n)
#  ^a  ^b  ^c           # check to see if a + b + c == 0
  [-4, -1, -1, 0, 1, 2] # move c to the next index
#  ^a  ^b      ^c       # check to see if a + b + c == 0 (recurring)
  [-4, -1, -1, 0, 1, 2] # if c hits the end
#  ^a  ^b            ^c 
  [-4, -1, -1, 0, 1, 2] # move b to the next index, move c to the one after b
#  ^a      ^b  ^c       # 
  [-4, -1, -1, 0, 1, 2] # move c to the next index until the end
#  ^a      ^b        ^c 
  [-4, -1, -1, 0, 1, 2] # move b to the next index, move c to the one after b
#  ^a          ^b ^c    
  [-4, -1, -1, 0, 1, 2] # once b and c are at the second last and last index
#  ^a             ^b ^c 
  [-4, -1, -1, 0, 1, 2] # move a to the next index, move b and c to indices right after a
#      ^a  ^b  ^c    
  [-4, -1, -1, 0, 1, 2] # if a solution is found
#      ^a  ^b        ^c # ?check to see if result array does not contain an array with same values
# result_arr            # (duplicates may not exist when using sorted array          )
[[-1, -1, 2]] # push [a, b, c] into result array