# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

# How many possible unique paths are there?


# Input
# m, n => cols, rows

# Output
# Number of possible unique paths

def unique_paths(col, row) # returns total number of unique paths from S to curr_coord
  return 0 if col == 0 && row == 0
  return 1 if col == 1 || row == 1
  return unique_paths(col - 1, row) + unique_paths(col, row - 1)
end

def unique_paths(col, row, memo = {})
  return 0 if col == 0 || row == 0
  return 1 if col == 1 && row == 1
  memo[[col, row]] ||= unique_paths(col - 1, row, memo) + unique_paths(col, row - 1, memo)
end

p unique_paths(3, 2)
p unique_paths(7, 3) # 28
p unique_paths(3, 3) # 6
# Example 1:

# [S] [ ] [1]
# [1] [1] [F]

# [S] [ ] [ ]
# [ ] [ ] [F]

# [S] [ ] [a]  # unique_paths(a) + unique_paths(b)
# [ ] [b] [F]

# [S] [a] [ ]  # unique_paths(a) + unique_paths(b)
# [b] [x] [F]

# [S] [ ] [ ]  # unique_path(s)
# [x] [ ] [F]

# [S] [x] [ ]  # unique_path(s)
# [ ] [ ] [F]

# [x] [ ] [ ]  # unique_path(s)
# [ ] [ ] [F]
          
#  0   0   0
# [S] [ ] [ ]  # unique_paths(a) = 0
# [ ] [b] [F]

#    0   0   0
# 0 [S] [ ] [ ]  # unique_paths(b) = 0
# 0 [ ] [b] [F]

#    0   0   0
# 0 [ ] [ ] [ ]  # unique_paths(b) = 0
# 0 [ ] [b] [F]



# Input: m = 3, n = 2
# Output: 3
# Explanation:
# From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
# 1. Right -> Right -> Down
# 2. Right -> Down -> Right
# 3. Down -> Right -> Right
# Example 2:

# Input: m = 7, n = 3
# Output: 28