# Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.

# For example, given the following triangle

[
     [2],
    [3,4],
   [6,5,7],
  [4,1,8,3]
]

# The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).

# Top-Down:
# min_path_at(bottom) = min_path_at(bottom - 1) + min(bottom)
# min_path_at(bottom - 1) = min_path_at(bottom - 2) + min(bottom - 1)
# ...
# min_path_at(x) = min_path_at(x - 1) + min(x)
# ...
# min_path_at(top + 1) = min_path_at(top) + min(top + 1)
# min_path_at(top) = min(top)

# Base case:
# min_path_at(top) = min(triangle[0])


def min_path(triangle)
  min_path_helper(triangle, level = triangle.size - 1)
end

def min_path_helper(triangle, level) # returns the minimum path to the current level
  return triangle[0][0] if level == 0
  return min_path_helper(triangle, level - 1) + min_adjacent(triangle, level)
end

def min_adjacent(triangle, level)
  # triangle[level].min # wrong implementation
end

triangle = [
     [2],
    [3,4],
   [6,5,7],
  [4,1,8,3]
]
p min_path(triangle)
 # 11

# Note:

# Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.

